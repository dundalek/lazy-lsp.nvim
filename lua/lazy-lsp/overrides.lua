-- Having overrides in a separate file so that we can provide custom implementations with functions
local lspconfig = require("lspconfig")
local helpers = require("lazy-lsp.helpers")

return {
  elixirls = {
    cmd = { "elixir-ls" },
  },
  jdtls = {
    on_new_config = function(new_config, new_root_dir)
      pcall(lspconfig.jdtls.document_config.default_config.on_new_config, new_config, new_root_dir)
      new_config.cmd = helpers.replace_first(new_config.cmd, "jdt-language-server")
    end,
  },
  millet = {
    cmd = { "millet-ls" },
  },
  omnisharp = {
    cmd = { "OmniSharp" },
  },
  rome = {
    cmd = { "rome", "lsp_proxy" },
  },
}
