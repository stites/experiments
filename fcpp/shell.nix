with (import <nixpkgs> {});

let
  fpcpp-ch1 = callPackage ./ch1 {};
  ranges-v3 = callPackage ./ch1/ranges-v3.nix {};
in
mkShell {
  buildInputs = [ fpcpp-ch1 ranges-v3 ];
}
