with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "lazy-lsp-env";
  buildInputs = [
    luajit
    luajitPackages.serpent
    git

    # for running tests in watch mode
    watchexec
  ];
}
