-- Having overrides in a separate file so that we can provide custom implementations with functions
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local helpers = require("lazy-lsp.helpers")

return {
  elixirls = {
    cmd = { "elixir-ls" },
  },
  gopls = {
    -- lspconfig tries to look up mod_cache which seems broken, do just simple root pattern
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  },
  -- java-language-server seems to have problems with lsp protocol, so let's not define a cmd for it
  -- java_language_server = {
  --   cmd = { "java-language-server" },
  -- },
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
  perlnavigator = {
    cmd = { "perlnavigator", "--stdio" },
  },
  rust_analyzer = {
    root_dir = function(fname)
      -- Default lspconfig root_dir detection uses cargo to try to detect workspace directory.
      -- It fails if cargo is not available, fallback to a simpler detection.
      if not vim.fn.executable("cargo") then
        return util.root_pattern("Cargo.toml")(fname)
            or util.root_pattern("rust-project.json")(fname)
            or util.find_git_ancestor(fname)
      end
      return lspconfig.jdtls.document_config.default_config.root_dir(fname)
    end
  },
}
