# lazy-lsp.nvim

Neovim plugin to automatically install [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) language servers. It is an alternative to [mason.nvim](https://github.com/williamboman/mason.nvim).

To ease the setup even further it can be complemented with [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim).

Language servers are loaded in the background without a need of a manual user intervention. They are not installed upfront, but only on-demand after a source file for a given language is opened. The plugin works by relying on Nix package manager which works on Linux, macOS and Windows WSL.

Currently available <!-- SERVER_COUNT_PLACEHOLDER -->134 out of 353<!-- SERVER_COUNT_PLACEHOLDER --> servers in lspconfig, see the full list of [supported servers](./servers.md).

## Install

Requires Neovim v0.7.0+

1. Install [Nix](https://nixos.org/download.html#nix-quick-install) package manager: `curl -L https://nixos.org/nix/install | sh`
2. Install the plugin using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "dundalek/lazy-lsp.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("lazy-lsp").setup {}
  end
},
```

Alternatively, you can install the plugin via [Nix/Home Manager](./notes.md#install-via-nixhome-manager).

3. That's it, nothing else to install!

## Setup

Quickest way to configure is to use [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) which sets up key bindings and autocompletion.

```lua
{
  "dundalek/lazy-lsp.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings to learn the available actions
      lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
      })
    end)

    require("lazy-lsp").setup {}
  end,
},
```

Another approach is to configure manually by passing `on_attach` handler which sets up keybindings and `capabilities` for autocompletion in the `default_config` section.

Available configuration options:

```lua
require("lazy-lsp").setup {
  -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
  excluded_servers = {
    "ccls", "zk",
  },
  -- Alternatively specify preferred servers for a filetype (others will be ignored).
  preferred_servers = {
    markdown = {},
    python = { "pyright" },
  },
  -- Default config passed to all servers to specify on_attach callback and other options.
  default_config = {
    flags = {
      debounce_text_changes = 150,
    },
    -- on_attach = on_attach,
    -- capabilities = capabilities,
  },
  -- Override config for specific servers that will passed down to lspconfig setup.
  -- Note that the default_config will be merged with this specific configuration so you don't need to specify everything twice.
  configs = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    },
  },
  prefer_local = true, -- Prefer locally installed servers over nix-shell (default: true)
}
```

## Curated servers

The philosophy of this plugin is to enable all possible plugins by default to get the highest chance of LSP functionality being available, even at a cost of starting multiple servers for a single language. Any misbehaving or unwanted servers can be excluded one by one. 

If this is not what you want, you can give a try to the [curated configuration](servers.md#curated-servers) that enables smaller selection of recommended servers.

## How it works

`lazy-lsp` registers all available configurations from lspconfig to start LSP servers by wrapping the commands in a [`nix shell`](https://nix.dev/manual/nix/latest/command-ref/new-cli/nix3-env-shell) or an older [nix-shell](https://nixos.org/manual/nix/unstable/command-ref/nix-shell.html) environment. The nix shell prepares the environment by pulling all specified dependencies regardless of what is installed on the host system and avoids packages clashes. The first time a server is run there is a delay until dependencies are downloaded, but on subsequent runs the time to prepare the shell environment is negligible.

## Versions

Nix uses channels to determine which packages and versions are available.
I recommend using the `unstable` channel to get the latest versions.

If you encounter an older version of a language server try to run `nix-channel --update` to update channels.
See [docs about channels](https://nixos.wiki/wiki/Nix_channels) for more details how to work with channels.

## Comparison with alternatives

- Installing manually, or via language specific package managers like npm, pip, etc. is a hassle.
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) / [mason.nvim](https://github.com/williamboman/mason.nvim)
  - Pro: Supports Windows natively
  - Pro: Supports more servers at the moment
  - Con: `:LspInstall` command needs to be run manually for each server  
    (vs. automatic installation in the background)
  - Con: Additional dependencies like npm, pip, etc. need to be installed separately  
    (vs. a single Nix dependency)
  - Con: Maintaining cross-platform installation scripts is a large maintanance burden  
    (vs. leveraging work by a large Nix community specializing in software packaging)
- [lspcontainers.nvim](https://github.com/lspcontainers/lspcontainers.nvim) - uses docker containers to run servers in a portable way which comes with an extra overhead

## Development

The available lsp servers and stats are generated from `nvim-lspconfig` source.

Make a local copy:

```
mkdir tmp && cd tmp
git clone https://github.com/neovim/nvim-lspconfig.git
```

Run `nix-shell` to load dependencies needed for running the dev scripts.

Update `servers.lua` with new entries:

```
cd tmp/nvim-lspconfig
git pull
cd ../..
scripts/update.lua
```

Once done specifying servers, generate the stats in [servers.md](servers.md):

```
scripts/genstats.lua
```

### Testing

Using Plenary for testing, see the [Testing Guide](https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md) for details.

Run tests (using [Babashka](https://babashka.org/) task runner):

```
bb test:once
```

Run tests in watch mode:

```
bb test
```
