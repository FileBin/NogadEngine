{ pkgs ? import <nixpkgs> {} }: with pkgs;
  stdenv.mkDerivation rec {
    pname = "nfrechette-acl";
    version = "2.1.0";
    commit_id = "v${version}";
    description = "Animation Compression Library";
    
    src = fetchFromGitHub {
      owner = "nfrechette";
      repo = "acl";
      fetchSubmodules = true;
      rev = commit_id;
      sha256 = "sha256-TnMZsbRKA2pAVnluyhCxj42eqVUMNP5il8IohTrlZcY="; 
    };

    patchPhase = ''
      sed -i 's/set(INCLUDE_UNIT_TESTS true)//g' CMakeLists.txt
    '';

    postInstall = ''
      cd /build/source
      mkdir -p $out/include
      cp -r includes/acl $out/include
      cd -
      mkdir -p $out/lib/pkgconfig
      cat > $out/lib/pkgconfig/${pname}.pc <<EOF
      prefix=$out
      exec_prefix=\''${prefix}
      includedir=\''${prefix}/include

      Name: ${pname}
      Description: ${description}
      Version: ${version}
      Cflags: -I\''${includedir}
      EOF
    '';

    nativeBuildInputs = [ 
      cmake
    ];
  }