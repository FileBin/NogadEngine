{ pkgs ? import <nixpkgs> {} }: with pkgs;
  stdenv.mkDerivation rec {
    pname = "LZMA-SDK";
    version = "9.20";
    commit_id = "v${version}";
    description = ''
      An unofficial LZMA SDK repository,
      built with all versions released on the official website and SourceForge over 20 years. 
    '';
    
    src = fetchFromGitHub {
      owner = "welovegit";
      repo = "LZMA-SDK";
      rev = commit_id;
      sha256 = "sha256-kq0LKdQuQ1c8ntZDwl1RHqA/IlWH/dOHphtoQNVznRY="; 
    };

    buildPhase = ''
      gcc -std=c99 -O3 -Wall -I. -D_7ZIP_ST -c -o LzmaDec.o C/LzmaDec.c
      gcc -std=c99 -O3 -Wall -I. -D_7ZIP_ST -c -o LzmaEnc.o C/LzmaEnc.c
      gcc -std=c99 -O3 -Wall -I. -D_7ZIP_ST -c -o LzFind.o C/LzFind.c
      ar rcs liblzma-sdk.a *.o
    '';

    installPhase = ''
      cd /build/source
      mkdir -p $out/include/lzma-sdk
      cp -r C/*.h $out/include/lzma-sdk

      mkdir -p $out/lib
      cp *.a $out/lib
      
      mkdir -p $out/lib/pkgconfig
      cat > $out/lib/pkgconfig/${pname}.pc <<EOF
      prefix=$out
      exec_prefix=\''${prefix}
      includedir=\''${prefix}/include
      libdir=\''${exec_prefix}/lib

      Name: ${pname}
      Description: ${description}
      Version: ${version}
      Libs: -L\''${libdir} -llzma-sdk
      Cflags: -I\''${includedir}
      EOF
    '';

    nativeBuildInputs = [ 
      gnumake
      libgcc
    ];
  }