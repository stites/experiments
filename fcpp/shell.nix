with (import <nixpkgs> {});

mkShell {
  buildInputs = [ llvmPackages_7.clang boost ];
}
