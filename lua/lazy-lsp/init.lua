local lspconfig = require("lspconfig")
local servers = require("lazy-lsp.servers")
local server_configs = require("lazy-lsp.helpers").server_configs

local function setup(opts)
  for server, server_opts in pairs(server_configs(lspconfig, servers, opts)) do
    lspconfig[server].setup(server_opts)
  end
end

return {
  setup = setup,
}
