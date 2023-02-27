with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "lazy-lsp-env";
  buildInputs = [
    git
    luajit
    luajitPackages.serpent
    neovim
    watchexec # for running tests in watch mode
  ];
}
