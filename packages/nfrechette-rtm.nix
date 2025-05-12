{ pkgs ? import <nixpkgs> {} }: with pkgs;
  stdenv.mkDerivation rec {
    pname = "nfrechette-rtm";
    version = "2.3.1";
    commit_id = "v${version}";
    description = "Realtime Math";
    
    src = fetchFromGitHub {
      owner = "nfrechette";
      repo = "rtm";
      rev = commit_id;
      sha256 = "sha256-Bzb7zoGkOl0+iwyippeF8rMP9VU6aOLzboA5kPiYzn0="; 
    };

    patchPhase = ''
      sed -i 's/add_subdirectory(".*tests")//g' CMakeLists.txt
    '';

    installPhase = ''
      cd /build/source
      mkdir -p $out/include
      cp -r includes/rtm $out/include
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