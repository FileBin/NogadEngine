{ pkgs ? import <nixpkgs> { } }: with pkgs;
stdenv.mkDerivation rec {
  pname = "murmurhash";
  version = "0.2.0";
  commit_id = version;
  description = "MurmurHash3 general hash bashed lookup function implementation";

  src = fetchFromGitHub {
    owner = "jwerle";
    repo = "murmurhash.c";
    rev = commit_id;
    sha256 = "sha256-vjxl7unVTewmeEDYWlbP6aSe1SdgfVUykDTH+q5JKvI=";
  };

  buildInputs = [
    libgcc 
  ];

  buildPhase = ''
    gcc -std=c99 -O3 -Wall -I. -DMURMURHASH_WANTS_HTOLE32=1 -c -o murmurhash.o murmurhash.c
    ar rcs libmurmurhash.a murmurhash.o
  '';

  installPhase = ''
    mkdir -p $out/include/${pname}
    cp *.h $out/include/${pname}

    mkdir -p $out/lib
    cp *.a $out/lib

    mkdir -p $out/lib/pkgconfig
    cat > $out/lib/pkgconfig/${pname}.pc <<EOF
    prefix=$out
    exec_prefix=\''${prefix}
    libdir=\''${exec_prefix}/lib
    includedir=\''${prefix}/include

    Name: ${pname}
    Description: ${description}
    Version: ${version}
    Libs: -L\''${libdir} -lmurmurhash
    Cflags: -I\''${includedir}
    EOF
  '';
}
