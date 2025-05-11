{ pkgs ? import <nixpkgs> { } }: with pkgs;
stdenv.mkDerivation rec {
  pname = "mumhash";
  version = "latest";
  commit_id = "1bf61b06e269e2ff5337a0323f1169e3ea7482db";

  src = fetchFromGitHub {
    owner = "vnmakarov";
    repo = "mum-hash";
    rev = commit_id;
    sha256 = "sha256-dQ8Q7awugOUVYu7uC0h7/ShbsGE7Bk8GTiYkU2EsldY=";
  };

  installPhase = ''
    mkdir -p $out/include/${pname}
    cp *.h $out/include/${pname}

    mkdir -p $out/lib/pkgconfig
    cat > $out/lib/pkgconfig/${pname}.pc <<EOF
    prefix=$out
    exec_prefix=\''${prefix}
    includedir=\''${prefix}/include

    Name: ${pname}
    Description: Hashing functions and PRNGs based on them
    Version: ${version}
    Cflags: -I\''${includedir}
    EOF
  '';
}
