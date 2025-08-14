## Override used Nix packages

In case you need to specify custom nix packages, you can override the default ones by specifying `on_new_config` callback with `in_shell` helper function:

```lua
require("lazy-lsp").setup {
  configs = {
    omnisharp = {
      on_new_config = function(new_config, new_root_dir)
        pcall(require("lspconfig").omnisharp.document_config.default_config.on_new_config, new_config, new_root_dir)
        local custom_nix_pkgs = { "omnisharp-roslyn" }
        new_config.cmd = require("lazy-lsp").in_shell(custom_nix_pkgs, new_config.cmd)
      end,
    },
  },
}
```

## Using UNFREE packages

Unfree LSPs like Intelephense for PHP fail to install by default with nix.

Possible workarounds are:
- Start nvim with unfree option like `NIXPKGS_ALLOW_UNFREE=1 nvim`.
- Or install the package globally like `NIXPKGS_ALLOW_UNFREE=1 nix-env -i intelephense` and lazy-lsp will use it instead of calling nix-shell.

## Additional Linters and Formatters (EFM)

You can use [efm-langserver](https://github.com/mattn/efm-langserver) to set up additional formatters and linters when LSP implementation is not available.

For example, use following config to get [shellcheck](https://www.shellcheck.net/) diagnostic messages when writing shell scripts:

```lua
require("lazy-lsp").setup {
  configs = {
    efm = {
      filetypes = { "sh" },
      settings = {
        languages = {
          sh = {
            {
              lintCommand = "shellcheck -f gcc -x",
              lintSource = "shellcheck",
              lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m",
                "%f:%l:%c: %tote: %m" },
            },
          },
        },
      },
      on_new_config = function(new_config)
        -- Override used packages to add additional dependencies
        local nix_pkgs = { "efm-langserver", "shellcheck" }
        new_config.cmd = require("lazy-lsp").in_shell(nix_pkgs, new_config.cmd)
      end,
    },
  },
}
```

## Install via Nix/Home Manager

`lazy-lsp-nvim` is available in the unstable channel. Install with:

```nix
{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-lsp-nvim
    ];
    extraConfig = ''
      lua << EOF
      require('lazy-lsp').setup {
        ...
      }
      EOF
    '';
  };
}
```

Alternatively, if you're using a different channel, you can package
the plugin locally and install it that way. Remember to include nvim-lspconfig.

```nix
{ pkgs, ... }:

let
  lazy-lsp-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lazy-lsp.nvim";
    version = "2022.10.09";
    src = pkgs.fetchFromGitHub {
      owner = "dundalek";
      repo = "lazy-lsp.nvim";
      rev = "d1731da0751317eae2c2b6b591e5c7f0216fc654";
      sha256 = "0jd9lywj5q09ccrpmvf0566dx8wf7qbnkny86pwx4mw556zgzbmy";
    };
    meta.homepage = "https://github.com/dundalek/lazy-lsp.nvim";
  };
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      lazy-lsp-nvim
    ];
    extraConfig = ''
      lua << EOF
      require('lazy-lsp').setup {
        ...
      }
      EOF
    '';
  };
}
```
