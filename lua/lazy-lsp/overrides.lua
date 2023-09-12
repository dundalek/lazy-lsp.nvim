-- Having overrides in a separate file so that we can provide custom implementations with functions

return {
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
