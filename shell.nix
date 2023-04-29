with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "lazy-lsp-env";
  buildInputs = [
    babashka
    git
    luajit
    luajitPackages.serpent
    neovim
    stylua
    watchexec # for running tests in watch mode
  ];
}
