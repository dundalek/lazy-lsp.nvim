with import <nixpkgs> { };
mkShell {
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
