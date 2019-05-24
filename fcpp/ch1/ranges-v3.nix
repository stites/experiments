{ stdenv, fetchFromGitHub, cmake, pkgconfig }:

stdenv.mkDerivation rec {
  name = "ranges-v3-${version}";
  version = "0.5.0";
  src = fetchFromGitHub {
    owner = "ericniebler";
    repo = name;
    rev = version;
    sha256 = "0v7r6k35dkyzmc647rg0fnn9lggg9kmjqr5gayj7ija4dl1982vs";
    fetchSubmodules = true;
  };
  nativeBuildInputs = [ cmake pkgconfig ];
  postInstall = ''
    mkdir -p $out/share/
    mv $out/lib/cmake/ $out/share/cmake
    echo "hello world"
  '';
  meta = with stdenv.lib; {
    description = "Experimental range library for C++11/14/17";
    homepage    = https://github.com/ericniebler/range-v3;
    # license     = stdenv.lib.licenses.boost;
  };

}
