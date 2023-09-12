local lspconfig = require("lspconfig")
local servers = require("lazy-lsp.servers")
local overrides = require("lazy-lsp.overrides")
local helpers = require("lazy-lsp.helpers")

local function setup(opts)
  for server, server_opts in pairs(helpers.server_configs(lspconfig, servers, opts, overrides)) do
    lspconfig[server].setup(server_opts)
  end
end

return {
  setup = setup,
  in_shell = helpers.in_shell,
}
