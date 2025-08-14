with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "lazy-lsp-env";
  buildInputs = [
    babashka
    git
    luajit
    luajitPackages.busted
    luajitPackages.luacov
    luajitPackages.serpent
    luajitPackages.vusted
    neovim
    stylua
    watchexec # for running tests in watch mode
  ];
}
