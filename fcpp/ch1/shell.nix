with (import <nixpkgs> {});

let
  fpcpp-ch1 = callPackage ./. {};
  ranges-v3 = callPackage ./ranges-v3.nix {};
in
mkShell {
  buildInputs = [ fpcpp-ch1 ranges-v3 ];
}
