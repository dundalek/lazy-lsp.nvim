local function replace_first(list, replacement)
  local result = vim.list_slice(list, 2)
  table.insert(result, 1, replacement)
  return result
end

local function escape_shell_arg(arg)
  return "'" .. string.gsub(arg, "'", "'\"'\"'") .. "'"
end

local function escape_shell_args(args)
  local escaped = {}
  for _, arg in ipairs(args) do
    table.insert(escaped, escape_shell_arg(arg))
  end
  return table.concat(escaped, " ")
end

local cache_nix_command_available = nil
-- Check whether both `nix` command and `nixpkgs` flake are available
---@return boolean?
local function nix_command_available()
  if cache_nix_command_available ~= nil then
    return cache_nix_command_available
  end
  cache_nix_command_available = false

  local registry = vim.fn.system({ "nix", "--flake-registry", "", "registry", "list" })
  if vim.v.shell_error == 0 then
    for flake in vim.gsplit(registry, "\n") do
      local flake_url = string.match(flake, "^%S+ flake:nixpkgs (.*)")
      if flake_url then
        -- And we won't accidentally fetch `nixpkgs-unstable` as it used to be.
        -- Only since NixOS 24.05, system has its nixpkgs flake in the registry by default
        if string.match(flake_url, "^path:") then
          cache_nix_command_available = true
        end
        break
      end
    end
  end
  return cache_nix_command_available
end

---@param nix_pkgs string[]
---@param cmd string[]
---@return string[]
local function in_shell(nix_pkgs, cmd)
  if #nix_pkgs == 0 then
    error("No nix pkg provided")
    return {}
  end

  local nix_cmd = {}
  if nix_command_available() then
    nix_cmd = { "nix", "--flake-registry", "", "shell" }
    for _, nix_pkg in ipairs(nix_pkgs) do
      table.insert(nix_cmd, "nixpkgs#" .. nix_pkg)
    end
    table.insert(nix_cmd, "--command")
    vim.list_extend(nix_cmd, cmd)
  else
    nix_cmd = { "nix-shell", "-p" }
    vim.list_extend(nix_cmd, nix_pkgs)
    table.insert(nix_cmd, "--run")
    table.insert(nix_cmd, escape_shell_args(cmd))
  end
  return nix_cmd
end

local function is_config_available(lspconfig, server)
  -- For deprecated servers we might get lspconfig entry, but without document_config
  return lspconfig[server] and lspconfig[server].document_config
end

local function make_server_filetypes_fn(lspconfig)
  return function(server)
    return lspconfig[server] and lspconfig[server].document_config and
        lspconfig[server].document_config.default_config.filetypes
  end
end

local function build_filetype_to_servers_index(servers, server_filetypes)
  local index = {}
  for server, _ in pairs(servers) do
    local filetypes = server_filetypes(server)
    if filetypes then
      for _, filetype in ipairs(filetypes) do
        if not index[filetype] then
          index[filetype] = {}
        end
        table.insert(index[filetype], server)
      end
    else
      -- what would be a good way to log this?
      -- print("no filetypes for", server)
    end
  end
  return index
end

local function build_server_to_filetypes_index(filetype_to_servers)
  local index = {}
  for filetype, servers in pairs(filetype_to_servers) do
    for _, server in ipairs(servers) do
      if not index[server] then
        index[server] = {}
      end
      table.insert(index[server], filetype)
    end
  end
  return index
end

local function enabled_filetypes_to_servers(servers, server_filetypes, excluded_servers, preferred_servers)
  local included_servers = {}
  for server, nix_pkg in pairs(servers) do
    -- check to exclude servers for which we don't have a nix package
    if nix_pkg ~= "" then
      included_servers[server] = true
    end
  end
  for _, server in ipairs(excluded_servers) do
    included_servers[server] = nil
  end

  local filetype_to_servers = build_filetype_to_servers_index(included_servers, server_filetypes)
  for filetype, filetype_servers in pairs(preferred_servers) do
    filetype_servers = type(filetype_servers) == "string" and { filetype_servers } or filetype_servers
    filetype_to_servers[filetype] = vim.tbl_filter(function(server)
      return included_servers[server]
    end, filetype_servers)
  end
  return filetype_to_servers
end

local function server_configs(lspconfig, servers, opts, overrides)
  opts = opts or {}
  local excluded_servers = opts.excluded_servers or {}
  local default_config = opts.default_config or {}
  local configs = opts.configs or {}
  local preferred_servers = opts.preferred_servers or {}
  local prefer_local = opts.prefer_local ~= false -- default: true

  local server_filetypes = make_server_filetypes_fn(lspconfig)
  local filetype_to_servers = enabled_filetypes_to_servers(servers, server_filetypes, excluded_servers, preferred_servers)
  local server_to_filetypes = build_server_to_filetypes_index(filetype_to_servers)

  local returned_configs = {}
  for lsp, _ in pairs(server_to_filetypes) do
    -- Check if a server is excluded first, so that we don't look up the config
    -- and for deprecated servers we won't get a warning message.
    if server_to_filetypes[lsp] and is_config_available(lspconfig, lsp) then
      local nix_pkg = servers[lsp]
      local lang_config = lspconfig[lsp]
      local user_config = configs[lsp]
      local config_override = overrides[lsp]

      local config = vim.tbl_extend(
        "keep",
        user_config or {},
        { filetypes = server_to_filetypes[lsp] },
        config_override or {},
        default_config,
        lang_config.document_config.default_config
      )

      if nix_pkg ~= "" and config.cmd then
        local original_on_new_config = config.on_new_config

        config.on_new_config = function(new_config, root_path)
          pcall(original_on_new_config, new_config, root_path)
          -- Don't wrap with nix shell if user callback already wrapped it
          if not vim.list_contains({ "nix", "nix-shell" }, new_config.cmd[1]) then
            if prefer_local == false or vim.fn.executable(new_config.cmd[1]) == 0 then
              local nix_pkgs = type(nix_pkg) == "string" and { nix_pkg } or nix_pkg
              new_config.cmd = in_shell(nix_pkgs, new_config.cmd)
            end
          end
        end

        returned_configs[lsp] = config
      elseif user_config then
        returned_configs[lsp] = vim.tbl_extend("keep", user_config, default_config)
      end
    end
  end
  return returned_configs
end

return {
  server_configs = server_configs,
  in_shell = in_shell,
  replace_first = replace_first,
  -- Internal, only for testing
  escape_shell_arg = escape_shell_arg,
  escape_shell_args = escape_shell_args,
  make_server_filetypes_fn = make_server_filetypes_fn,
  build_filetype_to_servers_index = build_filetype_to_servers_index,
  build_server_to_filetypes_index = build_server_to_filetypes_index,
  enabled_filetypes_to_servers = enabled_filetypes_to_servers,
}
