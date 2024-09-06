
## Curated servers

You can use the following configuration to enable a smaller selection of recommended servers that should work well for most users.

```lua
{
  excluded_servers = {
    "ccls",                            -- prefer clangd
    "denols",                          -- prefer eslint and ts_ls
    "docker_compose_language_service", -- yamlls should be enough?
    "flow",                            -- prefer eslint and ts_ls
    "ltex",                            -- grammar tool using too much CPU
    "quick_lint_js",                   -- prefer eslint and ts_ls
    "scry",                            -- archived on Jun 1, 2023
    "tailwindcss",                     -- associates with too many filetypes
  },
  preferred_servers = {
    markdown = {},
    python = { "pyright", "ruff_lsp" },
  },
}
```
## Servers by filetypes

Following table lists filetypes with more than one associated server.
It can be used to decide which servers to specify using the `excluded_servers` and `preferred_servers` configuration options.

| Filetype | Available servers | Curated selection |
| - | - | - |
| `astro` | [astro](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro), [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [astro](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro), [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint) |
| `bib` | [ltex](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ltex), [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab) | [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab) |
| `c` | [ccls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ccls), [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd), [sourcekit](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sourcekit) | [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd), [sourcekit](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sourcekit) |
| `clojure` | [clojure_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clojure_lsp), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [clojure_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clojure_lsp) |
| `comp` | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) |
| `context` | [digestif](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#digestif), [ltex](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ltex) | [digestif](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#digestif) |
| `cpp` | [ccls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ccls), [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd), [sourcekit](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sourcekit) | [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd), [sourcekit](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sourcekit) |
| `crystal` | [crystalline](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#crystalline), [scry](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#scry) | [crystalline](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#crystalline) |
| `cs` | [csharp_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#csharp_ls), [omnisharp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp) | [csharp_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#csharp_ls), [omnisharp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp) |
| `css` | [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls) |
| `cuda` | [ccls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ccls), [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) | [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) |
| `eelixir` | [elixirls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [elixirls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls) |
| `elixir` | [elixirls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [elixirls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls) |
| `frag` | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) |
| `geom` | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) |
| `glsl` | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) |
| `heex` | [elixirls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [elixirls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls) |
| `html` | [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html), [ltex](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ltex), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html) |
| `java` | [java_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#java_language_server), [jdtls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls) | [java_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#java_language_server), [jdtls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls) |
| `javascript` | [denols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols), [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [flow](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#flow), [quick_lint_js](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#quick_lint_js), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) |
| `javascript.jsx` | [denols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols), [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [flow](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#flow), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) |
| `javascriptreact` | [denols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols), [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [flow](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#flow), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) |
| `less` | [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls) |
| `markdown` | [ltex](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ltex), [marksman](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss), [zk](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#zk) |  |
| `nim` | [nim_langserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nim_langserver), [nimls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nimls) | [nim_langserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nim_langserver), [nimls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nimls) |
| `nix` | [nil_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nil_ls), [nixd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nixd) | [nil_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nil_ls), [nixd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nixd) |
| `objc` | [ccls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ccls), [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) | [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) |
| `objcpp` | [ccls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ccls), [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) | [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) |
| `perl` | [perlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlls), [perlnavigator](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlnavigator), [perlpls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlpls) | [perlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlls), [perlnavigator](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlnavigator), [perlpls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlpls) |
| `php` | [intelephense](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense), [phpactor](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#phpactor), [psalm](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#psalm), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [intelephense](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense), [phpactor](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#phpactor), [psalm](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#psalm) |
| `plaintex` | [digestif](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#digestif), [ltex](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ltex), [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab) | [digestif](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#digestif), [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab) |
| `proto` | [bufls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bufls), [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) | [bufls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bufls), [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) |
| `python` | [basedpyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#basedpyright), [jedi_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jedi_language_server), [pylsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp), [pylyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylyzer), [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright), [ruff_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp) | [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright), [ruff_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp) |
| `reason` | [ocamllsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ocamllsp), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [ocamllsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ocamllsp) |
| `rego` | [regal](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#regal), [regols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#regols) | [regal](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#regal), [regols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#regols) |
| `rmd` | [ltex](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ltex), [r_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#r_language_server) | [r_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#r_language_server) |
| `ruby` | [ruby_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruby_lsp), [solargraph](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph), [syntax_tree](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#syntax_tree) | [ruby_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruby_lsp), [solargraph](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph), [syntax_tree](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#syntax_tree) |
| `scss` | [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls) |
| `svelte` | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [svelte](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svelte), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [svelte](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svelte) |
| `systemverilog` | [svls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svls), [verible](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#verible) | [svls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svls), [verible](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#verible) |
| `templ` | [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html) |
| `terraform` | [terraform_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraform_lsp), [terraformls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraformls), [tflint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tflint) | [terraform_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraform_lsp), [terraformls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraformls), [tflint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tflint) |
| `tesc` | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) |
| `tese` | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) |
| `tex` | [digestif](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#digestif), [ltex](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ltex), [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab) | [digestif](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#digestif), [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab) |
| `typescript` | [denols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols), [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [quick_lint_js](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#quick_lint_js), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) |
| `typescript.tsx` | [denols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols), [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) |
| `typescriptreact` | [denols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols), [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) |
| `typst` | [tinymist](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tinymist), [typst_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#typst_lsp) | [tinymist](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tinymist), [typst_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#typst_lsp) |
| `verilog` | [svls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svls), [verible](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#verible) | [svls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svls), [verible](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#verible) |
| `vert` | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) | [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer), [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) |
| `vue` | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss), [volar](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar), [vuels](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vuels) | [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint), [volar](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar), [vuels](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vuels) |
| `yaml.docker-compose` | [docker_compose_language_service](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#docker_compose_language_service), [yamlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls) | [yamlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls) |

## Available servers: 120 / 321

| Language Server | Nix package |
| - | - |
| [ansiblels](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ansiblels) | [ansible-language-server](https://search.nixos.org/packages?channel=unstable&query=ansible-language-server&show=ansible-language-server) |
| [arduino_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#arduino_language_server) | [arduino-language-server](https://search.nixos.org/packages?channel=unstable&query=arduino-language-server&show=arduino-language-server) |
| [asm_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#asm_lsp) | [asm-lsp](https://search.nixos.org/packages?channel=unstable&query=asm-lsp&show=asm-lsp) |
| [astro](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro) | [nodePackages."@astrojs/language-server"](https://search.nixos.org/packages?channel=unstable&query=nodePackages."@astrojs/language-server"&show=nodePackages."@astrojs/language-server") |
| [basedpyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#basedpyright) | [basedpyright](https://search.nixos.org/packages?channel=unstable&query=basedpyright&show=basedpyright) |
| [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls) | [nodePackages.bash-language-server](https://search.nixos.org/packages?channel=unstable&query=nodePackages.bash-language-server&show=nodePackages.bash-language-server) |
| [beancount](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#beancount) | [beancount-language-server](https://search.nixos.org/packages?channel=unstable&query=beancount-language-server&show=beancount-language-server) |
| [blueprint_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#blueprint_ls) | [blueprint-compiler](https://search.nixos.org/packages?channel=unstable&query=blueprint-compiler&show=blueprint-compiler) |
| [bufls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bufls) | [buf-language-server](https://search.nixos.org/packages?channel=unstable&query=buf-language-server&show=buf-language-server) |
| [ccls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ccls) | [ccls](https://search.nixos.org/packages?channel=unstable&query=ccls&show=ccls) |
| [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) | [clang-tools_16](https://search.nixos.org/packages?channel=unstable&query=clang-tools_16&show=clang-tools_16) |
| [clojure_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clojure_lsp) | [clojure-lsp](https://search.nixos.org/packages?channel=unstable&query=clojure-lsp&show=clojure-lsp) |
| [cmake](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cmake) | [cmake-language-server](https://search.nixos.org/packages?channel=unstable&query=cmake-language-server&show=cmake-language-server) |
| [codeqlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#codeqlls) | [codeql](https://search.nixos.org/packages?channel=unstable&query=codeql&show=codeql) |
| [coq_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#coq_lsp) | [coqPackages.coq-lsp](https://search.nixos.org/packages?channel=unstable&query=coqPackages.coq-lsp&show=coqPackages.coq-lsp) |
| [crystalline](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#crystalline) | [crystalline](https://search.nixos.org/packages?channel=unstable&query=crystalline&show=crystalline) |
| [csharp_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#csharp_ls) | [csharp-ls](https://search.nixos.org/packages?channel=unstable&query=csharp-ls&show=csharp-ls) |
| [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls) | [nodePackages.vscode-langservers-extracted](https://search.nixos.org/packages?channel=unstable&query=nodePackages.vscode-langservers-extracted&show=nodePackages.vscode-langservers-extracted) |
| [dagger](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dagger) | [cuelsp](https://search.nixos.org/packages?channel=unstable&query=cuelsp&show=cuelsp) |
| [dartls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dartls) | [dart](https://search.nixos.org/packages?channel=unstable&query=dart&show=dart) |
| [denols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols) | [deno](https://search.nixos.org/packages?channel=unstable&query=deno&show=deno) |
| [dhall_lsp_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dhall_lsp_server) | [dhall-lsp-server](https://search.nixos.org/packages?channel=unstable&query=dhall-lsp-server&show=dhall-lsp-server) |
| [diagnosticls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#diagnosticls) | [nodePackages.diagnostic-languageserver](https://search.nixos.org/packages?channel=unstable&query=nodePackages.diagnostic-languageserver&show=nodePackages.diagnostic-languageserver) |
| [digestif](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#digestif) | [lua54Packages.digestif](https://search.nixos.org/packages?channel=unstable&query=lua54Packages.digestif&show=lua54Packages.digestif) |
| [docker_compose_language_service](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#docker_compose_language_service) | [docker-compose-language-service](https://search.nixos.org/packages?channel=unstable&query=docker-compose-language-service&show=docker-compose-language-service) |
| [dockerls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls) | [nodePackages.dockerfile-language-server-nodejs](https://search.nixos.org/packages?channel=unstable&query=nodePackages.dockerfile-language-server-nodejs&show=nodePackages.dockerfile-language-server-nodejs) |
| [dotls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dotls) | [dot-language-server](https://search.nixos.org/packages?channel=unstable&query=dot-language-server&show=dot-language-server) |
| [efm](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#efm) | [efm-langserver](https://search.nixos.org/packages?channel=unstable&query=efm-langserver&show=efm-langserver) |
| [elixirls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls) | [elixir_ls](https://search.nixos.org/packages?channel=unstable&query=elixir_ls&show=elixir_ls) |
| [elmls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elmls) | [elmPackages.elm-language-server](https://search.nixos.org/packages?channel=unstable&query=elmPackages.elm-language-server&show=elmPackages.elm-language-server) |
| [erlangls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#erlangls) | [erlang-ls](https://search.nixos.org/packages?channel=unstable&query=erlang-ls&show=erlang-ls) |
| [eslint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint) | [nodePackages.vscode-langservers-extracted](https://search.nixos.org/packages?channel=unstable&query=nodePackages.vscode-langservers-extracted&show=nodePackages.vscode-langservers-extracted) |
| [fennel_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#fennel_ls) | [fennel-ls](https://search.nixos.org/packages?channel=unstable&query=fennel-ls&show=fennel-ls) |
| [flow](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#flow) | [flow](https://search.nixos.org/packages?channel=unstable&query=flow&show=flow) |
| [fortls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#fortls) | [fortls](https://search.nixos.org/packages?channel=unstable&query=fortls&show=fortls) |
| [fsautocomplete](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#fsautocomplete) | [fsautocomplete](https://search.nixos.org/packages?channel=unstable&query=fsautocomplete&show=fsautocomplete) |
| [fstar](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#fstar) | [fstar](https://search.nixos.org/packages?channel=unstable&query=fstar&show=fstar) |
| [futhark_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#futhark_lsp) | [futhark](https://search.nixos.org/packages?channel=unstable&query=futhark&show=futhark) |
| [gleam](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gleam) | [gleam](https://search.nixos.org/packages?channel=unstable&query=gleam&show=gleam) |
| [glsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glsl_analyzer) | [glsl_analyzer](https://search.nixos.org/packages?channel=unstable&query=glsl_analyzer&show=glsl_analyzer) |
| [glslls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glslls) | [glslls](https://search.nixos.org/packages?channel=unstable&query=glslls&show=glslls) |
| [gopls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls) | [gopls](https://search.nixos.org/packages?channel=unstable&query=gopls&show=gopls) |
| [helm_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#helm_ls) | [helm-ls](https://search.nixos.org/packages?channel=unstable&query=helm-ls&show=helm-ls) |
| [hls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hls) | [haskell-language-server](https://search.nixos.org/packages?channel=unstable&query=haskell-language-server&show=haskell-language-server) |
| [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html) | [nodePackages.vscode-langservers-extracted](https://search.nixos.org/packages?channel=unstable&query=nodePackages.vscode-langservers-extracted&show=nodePackages.vscode-langservers-extracted) |
| [idris2_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#idris2_lsp) | [idris2Packages.idris2Lsp](https://search.nixos.org/packages?channel=unstable&query=idris2Packages.idris2Lsp&show=idris2Packages.idris2Lsp) |
| [intelephense](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense) | [nodePackages.intelephense](https://search.nixos.org/packages?channel=unstable&query=nodePackages.intelephense&show=nodePackages.intelephense) |
| [java_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#java_language_server) | [java-language-server](https://search.nixos.org/packages?channel=unstable&query=java-language-server&show=java-language-server) |
| [jdtls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls) | [jdt-language-server](https://search.nixos.org/packages?channel=unstable&query=jdt-language-server&show=jdt-language-server) |
| [jedi_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jedi_language_server) | [python3Packages.jedi-language-server](https://search.nixos.org/packages?channel=unstable&query=python3Packages.jedi-language-server&show=python3Packages.jedi-language-server) |
| [jqls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jqls) | [jq-lsp](https://search.nixos.org/packages?channel=unstable&query=jq-lsp&show=jq-lsp) |
| [jsonls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls) | [nodePackages.vscode-langservers-extracted](https://search.nixos.org/packages?channel=unstable&query=nodePackages.vscode-langservers-extracted&show=nodePackages.vscode-langservers-extracted) |
| [jsonnet_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonnet_ls) | [jsonnet-language-server](https://search.nixos.org/packages?channel=unstable&query=jsonnet-language-server&show=jsonnet-language-server) |
| [koka](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#koka) | [koka](https://search.nixos.org/packages?channel=unstable&query=koka&show=koka) |
| [kotlin_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#kotlin_language_server) | [kotlin-language-server](https://search.nixos.org/packages?channel=unstable&query=kotlin-language-server&show=kotlin-language-server) |
| [ltex](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ltex) | [ltex-ls](https://search.nixos.org/packages?channel=unstable&query=ltex-ls&show=ltex-ls) |
| [lua_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls) | [lua-language-server](https://search.nixos.org/packages?channel=unstable&query=lua-language-server&show=lua-language-server) |
| [marksman](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman) | [marksman](https://search.nixos.org/packages?channel=unstable&query=marksman&show=marksman) |
| [matlab_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#matlab_ls) | [matlab-language-server](https://search.nixos.org/packages?channel=unstable&query=matlab-language-server&show=matlab-language-server) |
| [metals](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#metals) | [metals](https://search.nixos.org/packages?channel=unstable&query=metals&show=metals) |
| [millet](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#millet) | [millet](https://search.nixos.org/packages?channel=unstable&query=millet&show=millet) |
| [mint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#mint) | [mint](https://search.nixos.org/packages?channel=unstable&query=mint&show=mint) |
| [nginx_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nginx_language_server) | [nginx-language-server](https://search.nixos.org/packages?channel=unstable&query=nginx-language-server&show=nginx-language-server) |
| [nickel_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nickel_ls) | [nls](https://search.nixos.org/packages?channel=unstable&query=nls&show=nls) |
| [nil_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nil_ls) | [nil](https://search.nixos.org/packages?channel=unstable&query=nil&show=nil) |
| [nim_langserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nim_langserver) | [nimlangserver](https://search.nixos.org/packages?channel=unstable&query=nimlangserver&show=nimlangserver) |
| [nimls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nimls) | [nimlsp](https://search.nixos.org/packages?channel=unstable&query=nimlsp&show=nimlsp) |
| [nixd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nixd) | [nixd](https://search.nixos.org/packages?channel=unstable&query=nixd&show=nixd) |
| [nushell](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nushell) | [nushell](https://search.nixos.org/packages?channel=unstable&query=nushell&show=nushell) |
| [ocamllsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ocamllsp) | [ocamlPackages.ocaml-lsp](https://search.nixos.org/packages?channel=unstable&query=ocamlPackages.ocaml-lsp&show=ocamlPackages.ocaml-lsp) |
| [omnisharp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp) | [omnisharp-roslyn](https://search.nixos.org/packages?channel=unstable&query=omnisharp-roslyn&show=omnisharp-roslyn) |
| [openscad_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#openscad_lsp) | [openscad-lsp](https://search.nixos.org/packages?channel=unstable&query=openscad-lsp&show=openscad-lsp) |
| [perlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlls) | [perlPackages.PerlLanguageServer](https://search.nixos.org/packages?channel=unstable&query=perlPackages.PerlLanguageServer&show=perlPackages.PerlLanguageServer) |
| [perlnavigator](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlnavigator) | [perlnavigator](https://search.nixos.org/packages?channel=unstable&query=perlnavigator&show=perlnavigator) |
| [perlpls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#perlpls) | [perl538Packages.PLS](https://search.nixos.org/packages?channel=unstable&query=perl538Packages.PLS&show=perl538Packages.PLS) |
| [phpactor](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#phpactor) | [phpactor](https://search.nixos.org/packages?channel=unstable&query=phpactor&show=phpactor) |
| [postgres_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#postgres_lsp) | [postgres-lsp](https://search.nixos.org/packages?channel=unstable&query=postgres-lsp&show=postgres-lsp) |
| [prismals](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#prismals) | [nodePackages."@prisma/language-server"](https://search.nixos.org/packages?channel=unstable&query=nodePackages."@prisma/language-server"&show=nodePackages."@prisma/language-server") |
| [psalm](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#psalm) | [php80Packages.psalm](https://search.nixos.org/packages?channel=unstable&query=php80Packages.psalm&show=php80Packages.psalm) |
| [purescriptls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#purescriptls) | [nodePackages.purescript-language-server](https://search.nixos.org/packages?channel=unstable&query=nodePackages.purescript-language-server&show=nodePackages.purescript-language-server) |
| [pylsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp) | [python3Packages.python-lsp-server](https://search.nixos.org/packages?channel=unstable&query=python3Packages.python-lsp-server&show=python3Packages.python-lsp-server) |
| [pylyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylyzer) | [pylyzer](https://search.nixos.org/packages?channel=unstable&query=pylyzer&show=pylyzer) |
| [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright) | [pyright](https://search.nixos.org/packages?channel=unstable&query=pyright&show=pyright) |
| [quick_lint_js](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#quick_lint_js) | [quick-lint-js](https://search.nixos.org/packages?channel=unstable&query=quick-lint-js&show=quick-lint-js) |
| [r_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#r_language_server) | [rPackages.languageserver](https://search.nixos.org/packages?channel=unstable&query=rPackages.languageserver&show=rPackages.languageserver) |
| [regal](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#regal) | [regal](https://search.nixos.org/packages?channel=unstable&query=regal&show=regal) |
| [regols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#regols) | [regols](https://search.nixos.org/packages?channel=unstable&query=regols&show=regols) |
| [ruby_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruby_lsp) | [rubyPackages.ruby-lsp](https://search.nixos.org/packages?channel=unstable&query=rubyPackages.ruby-lsp&show=rubyPackages.ruby-lsp) |
| [ruff_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp) | [ruff-lsp](https://search.nixos.org/packages?channel=unstable&query=ruff-lsp&show=ruff-lsp) |
| [rune_languageserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rune_languageserver) | [rune-languageserver](https://search.nixos.org/packages?channel=unstable&query=rune-languageserver&show=rune-languageserver) |
| [rust_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer) | [rust-analyzer](https://search.nixos.org/packages?channel=unstable&query=rust-analyzer&show=rust-analyzer) |
| [scry](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#scry) | [scry](https://search.nixos.org/packages?channel=unstable&query=scry&show=scry) |
| [slint_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#slint_lsp) | [slint-lsp](https://search.nixos.org/packages?channel=unstable&query=slint-lsp&show=slint-lsp) |
| [solargraph](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph) | [rubyPackages.solargraph](https://search.nixos.org/packages?channel=unstable&query=rubyPackages.solargraph&show=rubyPackages.solargraph) |
| [solc](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solc) | [solc](https://search.nixos.org/packages?channel=unstable&query=solc&show=solc) |
| [sourcekit](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sourcekit) | [sourcekit-lsp](https://search.nixos.org/packages?channel=unstable&query=sourcekit-lsp&show=sourcekit-lsp) |
| [svelte](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svelte) | [nodePackages.svelte-language-server](https://search.nixos.org/packages?channel=unstable&query=nodePackages.svelte-language-server&show=nodePackages.svelte-language-server) |
| [svls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svls) | [svls](https://search.nixos.org/packages?channel=unstable&query=svls&show=svls) |
| [syntax_tree](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#syntax_tree) | [rubyPackages.syntax_tree](https://search.nixos.org/packages?channel=unstable&query=rubyPackages.syntax_tree&show=rubyPackages.syntax_tree) |
| [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) | [nodePackages."@tailwindcss/language-server"](https://search.nixos.org/packages?channel=unstable&query=nodePackages."@tailwindcss/language-server"&show=nodePackages."@tailwindcss/language-server") |
| [taplo](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#taplo) | [taplo-lsp](https://search.nixos.org/packages?channel=unstable&query=taplo-lsp&show=taplo-lsp) |
| [teal_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#teal_ls) | [luajitPackages.teal-language-server](https://search.nixos.org/packages?channel=unstable&query=luajitPackages.teal-language-server&show=luajitPackages.teal-language-server) |
| [terraform_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraform_lsp) | [terraform-lsp](https://search.nixos.org/packages?channel=unstable&query=terraform-lsp&show=terraform-lsp) |
| [terraformls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraformls) | [terraform-ls](https://search.nixos.org/packages?channel=unstable&query=terraform-ls&show=terraform-ls) |
| [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab) | [texlab](https://search.nixos.org/packages?channel=unstable&query=texlab&show=texlab) |
| [tflint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tflint) | [tflint](https://search.nixos.org/packages?channel=unstable&query=tflint&show=tflint) |
| [tilt_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tilt_ls) | [tilt](https://search.nixos.org/packages?channel=unstable&query=tilt&show=tilt) |
| [tinymist](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tinymist) | [tinymist](https://search.nixos.org/packages?channel=unstable&query=tinymist&show=tinymist) |
| [ts_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls) | [nodePackages.typescript-language-server](https://search.nixos.org/packages?channel=unstable&query=nodePackages.typescript-language-server&show=nodePackages.typescript-language-server) |
| [typst_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#typst_lsp) | [typst-lsp](https://search.nixos.org/packages?channel=unstable&query=typst-lsp&show=typst-lsp) |
| [vala_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vala_ls) | [vala-language-server](https://search.nixos.org/packages?channel=unstable&query=vala-language-server&show=vala-language-server) |
| [verible](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#verible) | [verible](https://search.nixos.org/packages?channel=unstable&query=verible&show=verible) |
| [vhdl_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vhdl_ls) | [vhdl-ls](https://search.nixos.org/packages?channel=unstable&query=vhdl-ls&show=vhdl-ls) |
| [vimls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls) | [nodePackages.vim-language-server](https://search.nixos.org/packages?channel=unstable&query=nodePackages.vim-language-server&show=nodePackages.vim-language-server) |
| [vls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vls) | [vlang](https://search.nixos.org/packages?channel=unstable&query=vlang&show=vlang) |
| [volar](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar) | [nodePackages."@volar/vue-language-server"](https://search.nixos.org/packages?channel=unstable&query=nodePackages."@volar/vue-language-server"&show=nodePackages."@volar/vue-language-server") |
| [vuels](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vuels) | [nodePackages.vue-language-server](https://search.nixos.org/packages?channel=unstable&query=nodePackages.vue-language-server&show=nodePackages.vue-language-server) |
| [yamlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls) | [nodePackages.yaml-language-server](https://search.nixos.org/packages?channel=unstable&query=nodePackages.yaml-language-server&show=nodePackages.yaml-language-server) |
| [zk](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#zk) | [zk](https://search.nixos.org/packages?channel=unstable&query=zk&show=zk) |
| [zls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#zls) | [zls](https://search.nixos.org/packages?channel=unstable&query=zls&show=zls) |

## Missing: 201

- [agda_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#agda_ls)
- [aiken](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#aiken)
- [anakin_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#anakin_language_server)
- [angularls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#angularls)
- [antlersls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#antlersls)
- [apex_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#apex_ls)
- [ast_grep](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ast_grep)
- [autotools_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#autotools_ls)
- [awk_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#awk_ls)
- [azure_pipelines_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#azure_pipelines_ls)
- [bacon_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bacon_ls)
- [ballerina](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ballerina)
- [bazelrc_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bazelrc_lsp)
- [bicep](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bicep)
- [biome](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome)
- [bitbake_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bitbake_language_server)
- [bitbake_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bitbake_ls)
- [bqnlsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bqnlsp)
- [bright_script](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bright_script)
- [bsl_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bsl_ls)
- [buck2](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#buck2)
- [buddy_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#buddy_ls)
- [bzl](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bzl)
- [cadence](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cadence)
- [cairo_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cairo_ls)
- [cds_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cds_lsp)
- [circom-lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#circom-lsp)
- [clarity_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clarity_lsp)
- [cobol_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cobol_ls)
- [coffeesense](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#coffeesense)
- [contextive](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#contextive)
- [css_variables](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#css_variables)
- [cssmodules_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssmodules_ls)
- [cucumber_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cucumber_language_server)
- [custom_elements_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#custom_elements_ls)
- [cypher_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cypher_ls)
- [dafny](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dafny)
- [dcmls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dcmls)
- [debputy](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#debputy)
- [delphi_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#delphi_ls)
- [djlsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#djlsp)
- [dolmenls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dolmenls)
- [dprint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dprint)
- [drools_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#drools_lsp)
- [ds_pinyin_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ds_pinyin_lsp)
- [earthlyls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#earthlyls)
- [ecsact](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ecsact)
- [elp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elp)
- [ember](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ember)
- [emmet_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_language_server)
- [emmet_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_ls)
- [erg_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#erg_language_server)
- [esbonio](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#esbonio)
- [facility_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#facility_language_server)
- [fennel_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#fennel_language_server)
- [fish_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#fish_lsp)
- [flux_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#flux_lsp)
- [foam_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#foam_ls)
- [fsharp_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#fsharp_language_server)
- [gdscript](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gdscript)
- [gdshader_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gdshader_lsp)
- [ghcide](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ghcide)
- [ghdl_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ghdl_ls)
- [ginko_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ginko_ls)
- [gitlab_ci_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gitlab_ci_ls)
- [glasgow](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glasgow)
- [glint](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#glint)
- [golangci_lint_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#golangci_lint_ls)
- [gradle_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gradle_ls)
- [grammarly](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#grammarly)
- [graphql](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#graphql)
- [groovyls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#groovyls)
- [guile_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#guile_ls)
- [harper_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#harper_ls)
- [haxe_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#haxe_language_server)
- [hdl_checker](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hdl_checker)
- [hhvm](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hhvm)
- [hie](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hie)
- [hlasm](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hlasm)
- [hoon_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hoon_ls)
- [htmx](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#htmx)
- [hydra_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hydra_lsp)
- [hyprls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hyprls)
- [janet_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#janet_lsp)
- [jinja_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jinja_lsp)
- [julials](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#julials)
- [lean3ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lean3ls)
- [leanls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#leanls)
- [lelwel_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lelwel_ls)
- [lemminx](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lemminx)
- [lexical](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lexical)
- [luau_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#luau_lsp)
- [lwc_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lwc_ls)
- [m68k](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#m68k)
- [markdown_oxide](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#markdown_oxide)
- [mdx_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#mdx_analyzer)
- [mesonlsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#mesonlsp)
- [mlir_lsp_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#mlir_lsp_server)
- [mlir_pdll_lsp_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#mlir_pdll_lsp_server)
- [mm0_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#mm0_ls)
- [mojo](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#mojo)
- [motoko_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#motoko_lsp)
- [move_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#move_analyzer)
- [msbuild_project_tools_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#msbuild_project_tools_server)
- [mutt_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#mutt_ls)
- [nelua_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nelua_lsp)
- [neocmake](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#neocmake)
- [nextls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nextls)
- [nomad_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nomad_lsp)
- [ntt](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ntt)
- [nxls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#nxls)
- [ols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ols)
- [opencl_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#opencl_ls)
- [openedge_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#openedge_ls)
- [openscad_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#openscad_ls)
- [pact_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pact_ls)
- [pasls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pasls)
- [pbls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pbls)
- [pest_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pest_ls)
- [phan](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#phan)
- [pico8_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pico8_ls)
- [pkgbuild_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pkgbuild_language_server)
- [please](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#please)
- [powershell_es](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#powershell_es)
- [prolog_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#prolog_ls)
- [prosemd_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#prosemd_lsp)
- [protols](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#protols)
- [pug](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pug)
- [puppet](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#puppet)
- [pyre](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyre)
- [qml_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#qml_lsp)
- [qmlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#qmlls)
- [racket_langserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#racket_langserver)
- [raku_navigator](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#raku_navigator)
- [reason_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#reason_ls)
- [relay_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#relay_lsp)
- [remark_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#remark_ls)
- [rescriptls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rescriptls)
- [rls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rls)
- [robotframework_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#robotframework_ls)
- [roc_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#roc_ls)
- [rubocop](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rubocop)
- [ruff](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff)
- [salt_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#salt_ls)
- [scheme_langserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#scheme_langserver)
- [serve_d](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#serve_d)
- [shopify_theme_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#shopify_theme_ls)
- [sixtyfps](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sixtyfps)
- [slangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#slangd)
- [smarty_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#smarty_ls)
- [smithy_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#smithy_ls)
- [snakeskin_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#snakeskin_ls)
- [snyk_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#snyk_ls)
- [solang](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solang)
- [solidity](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solidity)
- [solidity_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solidity_ls)
- [solidity_ls_nomicfoundation](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solidity_ls_nomicfoundation)
- [somesass_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#somesass_ls)
- [sorbet](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sorbet)
- [sourcery](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sourcery)
- [spectral](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#spectral)
- [spyglassmc_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#spyglassmc_language_server)
- [sqlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sqlls)
- [standardrb](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#standardrb)
- [starlark_rust](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#starlark_rust)
- [starpls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#starpls)
- [statix](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#statix)
- [steep](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#steep)
- [stimulus_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#stimulus_ls)
- [stylelint_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#stylelint_lsp)
- [superhtml](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#superhtml)
- [svlangserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svlangserver)
- [swift_mesonls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#swift_mesonls)
- [tabby_ml](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tabby_ml)
- [tblgen_lsp_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tblgen_lsp_server)
- [templ](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#templ)
- [textlsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#textlsp)
- [theme_check](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#theme_check)
- [thriftls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#thriftls)
- [tsp_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsp_server)
- [ttags](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ttags)
- [turtle_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#turtle_ls)
- [tvm_ffi_navigator](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tvm_ffi_navigator)
- [twiggy_language_server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#twiggy_language_server)
- [typeprof](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#typeprof)
- [typos_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#typos_lsp)
- [uiua](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#uiua)
- [unison](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#unison)
- [unocss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#unocss)
- [uvls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#uvls)
- [v_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#v_analyzer)
- [vacuum](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vacuum)
- [vale_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vale_ls)
- [vdmj](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vdmj)
- [veridian](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#veridian)
- [veryl_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#veryl_ls)
- [visualforce_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#visualforce_ls)
- [vtsls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vtsls)
- [wgsl_analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#wgsl_analyzer)
- [yang_lsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yang_lsp)
- [yls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yls)
