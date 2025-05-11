{ pkgs ? import <nixpkgs> {} }: with pkgs; 
  let
    EABase = pkgs.callPackage ./eabase.nix {};
  in
  stdenv.mkDerivation rec {
    pname = "EASTL";
    version = "3.21.23";
    
    nativeBuildInputs = [ 
      cmake
      pkg-config
    ];

    src = fetchFromGitHub {
      owner = "electronicarts";
      repo = "EASTL";
      rev = "${version}";
      sha256 = "sha256-8imixecWN/FOHY/9IxkIMbkxK7NXZ0TecZ4/SvOqf14="; 
    };

    cmakeFlags = [ 
      "-DFETCHCONTENT_SOURCE_DIR_EABASE=${EABase.out}" 
      "-DCMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES=${EABase.out}/include"
    ];

    postInstall = ''
      mkdir -p $out/lib/pkgconfig
      cat > $out/lib/pkgconfig/eastl.pc <<EOF
      prefix=$out
      exec_prefix=\''${prefix}
      libdir=\''${exec_prefix}/lib
      includedir=\''${prefix}/include

      Name: EASTL
      Description: Electronic Arts Standard Template Library
      Version: ${version}
      Libs: -L\''${libdir} -lEASTL
      Cflags: -I\''${includedir} -I${EABase.out}/include
      EOF
    '';
  }