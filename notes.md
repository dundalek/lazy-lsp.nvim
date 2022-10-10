
### Install via Nix/Home Manager

Alternatively, if you're using nix to manage your Neovim config, you can package
the plugin locally and install it that way. Remember to include nvim-lspconfig.

```nix
{ pkgs, ... }:

let
  nvim-lazy-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
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
      nvim-lazy-lsp
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
