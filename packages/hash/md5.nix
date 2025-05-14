{ pkgs ? import <nixpkgs> { } }: with pkgs;
stdenv.mkDerivation rec {
  pname = "md5";
  version = "latest";
  commit_id = "ffab404e8b4910de979d135be6c950f89086f945";
  description = "Copy of md5 implemented by L. Peter Deutsch";

  src = fetchFromGitHub {
    owner = "minh0722";
    repo = "md5";
    rev = commit_id;
    sha256 = "sha256-Ijz1oAT5dU0S72b8tL5JBLq1y+O7mwR5cVJF7oGfhV4=";
  };

  buildInputs = [
    libgcc
  ];

  buildPhase = ''
    gcc -std=c99 -O3 -Wall -I. -DMURMURHASH_WANTS_HTOLE32=1 -c -o md5.o md5.c
    ar rcs libmd5.a md5.o
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
    Libs: -L\''${libdir} -l${pname}
    Cflags: -I\''${includedir}
    EOF
  '';
}
