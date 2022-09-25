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
  local excluded_servers = opts.excluded_servers or {}
  local default_config = opts.default_config or {}

  for lsp, nix_pkg in pairs(servers) do
    if lspconfig[lsp] and not vim.tbl_contains(excluded_servers, lsp) then
      local cmd = (opts.configs[lsp] and opts.configs[lsp].cmd) or lspconfig[lsp].document_config.default_config.cmd
      if nix_pkg ~= "" and cmd then
        local config = opts.configs[lsp] or default_config
        local nix_pkgs = type(nix_pkg) == "string" and { nix_pkg } or nix_pkg.pkgs
        local nix_cmd = { "nix-shell", "-p" }
        vim.list_extend(nix_cmd, nix_pkgs)
        table.insert(nix_cmd, "--run")
        table.insert(nix_cmd, escape_shell_args(cmd))
        config = vim.tbl_extend("keep", { cmd = nix_cmd }, config)
        lspconfig[lsp].setup(config)
      elseif opts.configs[lsp] then
        lspconfig[lsp].setup(opts.configs[lsp])
      end
    end
  end
end

return {
  setup = setup
}
