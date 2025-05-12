{ pkgs ? import <nixpkgs> { } }: with pkgs;
stdenv.mkDerivation rec {
  pname = "wyhash";
  version = "final4";
  commit_id = "wyhash_final4";
  description = "The FASTEST QUALITY hash function, random number generators (PRNG) and hash map.";

  src = fetchFromGitHub {
    owner = "wangyi-fudan";
    repo = "wyhash";
    rev = commit_id;
    sha256 = "sha256-/FkVumXtf6fY+pnzyiqQ+JocR4IazZMyv7uLydyBXZ0=";
  };

  buildPhase = ''
    echo "buildPhase"
  '';

  installPhase = ''
    mkdir -p $out/include/${pname}
    cp *.h $out/include/${pname}

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
}
