# lazy-lsp.nvim

Neovim plugin to automatically install [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) language servers.

Language servers are loaded in the background without a need of a manual user intervention. They are not installed upfront, but only on-demand after a source file for a given language is opened. The plugin works by relying on Nix package manager which works on Linux, macOS and Windows WSL.

Currently supports 78 out of 212 servers available in lspconfig, see the full list of [supported servers](./servers.md).

## Install

Requires Neovim v0.7.0+

1) Install [Nix](https://nixos.org/download.html#nix-quick-install) package manager:  `curl -L https://nixos.org/nix/install | sh`
2) Install the plugin using [packer](https://github.com/wbthomason/packer.nvim):

```
use { 'dundalek/lazy-lsp.nvim', requires = { 'neovim/nvim-lspconfig' } }
```

Alternatively, you can install the plugin via [Nix/Home Manager](./notes.md#install-via-nix%2Fhome-manager).

3) That's it, nothing else to install!

## Setup

Add to `init.lua`:

```lua
require('lazy-lsp').setup {
  -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
  excluded_servers = {
    "ccls", "zk",
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
  -- Note that the default_config will be nerged with this specific configuration so you don't need to specify everything twice.
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
}
```

For `init.vim` based config wrap with lua command:
```vim
lua << EOF
require('lazy-lsp').setup {
  ...
}
EOF
```

## How it works

`lazy-lsp` registers all available configurations from lspconfig to start LSP servers by wrapping the commands in a [nix-shell](https://nixos.org/manual/nix/unstable/command-ref/nix-shell.html) environment. The nix-shell prepares the environment by pulling all specified dependencies regardless of what is installed on the host system and avoids packages clashes. The first time a server is run there is a delay until dependencies are downloaded, but on subsequent runs the time to prepare the shell environment is negligeable.

## Comparison with alternatives

- Installing manually, or via language specific package managers like npm, pip, etc. is a hassle.
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
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

Run tests:
```
scripts/test
```

Run tests in watch mode:
```
scripts/test-watch
```
