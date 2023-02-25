local lspconfig = require('lspconfig')
local servers = require('lazy-lsp.servers')

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

local function setup(opts)
  opts = opts or {}
  local excluded_servers = opts.excluded_servers or {}
  local default_config = opts.default_config or {}
  local common_config = opts.common_config or {}
  local configs = opts.configs or {}

  for lsp, npkg in pairs(servers) do
    if lspconfig[lsp] and not vim.tbl_contains(excluded_servers, lsp) then
      -- Allow users to override nix_pkg (to quickly support new servers)
      local nix_pkg = (configs[lsp] and configs[lsp].nix_pkg) or npkg
      if configs[lsp] then
        configs[lsp].nix_pkg = nil
      end

      local cmd = (configs[lsp] and configs[lsp].cmd) or
          (type(nix_pkg) == "table" and nix_pkg.cmd) or
          lspconfig[lsp].document_config.default_config.cmd
      if nix_pkg ~= "" and cmd then
        local config = vim.tbl_extend("keep", configs[lsp] or default_config, common_config)
        local nix_pkgs = type(nix_pkg) == "string" and { nix_pkg } or nix_pkg.pkgs
        local nix_cmd = { "nix-shell", "-p" }
        vim.list_extend(nix_cmd, nix_pkgs)
        table.insert(nix_cmd, "--run")
        table.insert(nix_cmd, escape_shell_args(cmd))
        config = vim.tbl_extend("keep", { cmd = nix_cmd }, config)
        lspconfig[lsp].setup(config)
      elseif configs[lsp] then
        local config = vim.tbl_extend("keep", configs[lsp], common_config)
        lspconfig[lsp].setup(config)
      end
    end
  end
end

return {
  setup = setup
}
