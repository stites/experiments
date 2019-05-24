{ pkgs ? (import <nixpkgs> {})
, source ? ./.
}:

with pkgs;

let
  llvmPkgs = llvmPackages_7;
  ranges-v3 = callPackage ./ranges-v3.nix {};
in
llvmPkgs.libcxxStdenv.mkDerivation rec {
  name = "fpcpp-${version}";
  version = "ch1";
  src = lib.cleanSource source;

  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [ llvmPkgs.libcxxClang boost ranges-v3 ];
  hardeningDisable = [ "all" ];
  preInstall = ''
    echo hello world
    '';
  postInstall = ''
    echo hello $out
    ls $out
    echo hello ./
    ls ./
    '';
}
