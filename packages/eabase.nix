{ pkgs ? import <nixpkgs> {} }: with pkgs;
  stdenv.mkDerivation rec {
    pname = "EABASE";
    version = "stable";
    commit_id = "123363eb82e132c0181ac53e43226d8ee76dea12";
    
    src = fetchFromGitHub {
      owner = "electronicarts";
      repo = "EABase";
      rev = commit_id;
      sha256 = "sha256-tQcGoOeyptMf/KQGC+o9P6XiTfJhi0xjwB2M/3JtnW4="; 
    };

    nativeBuildInputs = [ 
      cmake
    ];
  }