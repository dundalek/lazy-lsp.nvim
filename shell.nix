with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "lazy-lsp-env";
  buildInputs = [
    luajit
    luajitPackages.luarocks
  ];
  shellHook = ''
    # luarocks install --local serpent
  '';
}
