with (import <nixpkgs> {  });
let
  EABase = pkgs.callPackage ({ stdenv, fetchFromGitHub }: 
    stdenv.mkDerivation rec {
      pname = "EABASE";
      version = "123363eb82e132c0181ac53e43226d8ee76dea12";
      
      src = fetchFromGitHub {
        owner = "electronicarts";
        repo = "EABase";
        rev = "${version}";
        sha256 = "sha256-tQcGoOeyptMf/KQGC+o9P6XiTfJhi0xjwB2M/3JtnW4="; 
      };

      nativeBuildInputs = [ 
        cmake
      ];
    }) {};
  EASTL = pkgs.callPackage ({ stdenv, fetchFromGitHub }: 
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
        Cflags: -I\''${includedir}
        EOF
      '';
    }) {};
in
mkShell rec {
    buildInputs = [
        libgcc
        glib
        clang-tools
        gh
        python313
        python313Packages.pip
        xorg.libX11
        xorg.libXrandr
        fltk
        xorg.libxkbfile
        udev
        pulseaudioFull
        alsa-oss
        nasm
        zlib
        vulkan-loader
        jq
        meson
        mesonlsp
        SDL2
        ninja
        EASTL
        cmake
        pkg-config
    ];
    
    packages = [
        (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
                llvm-vs-code-extensions.vscode-clangd
                ms-vscode.cpptools
                ms-vscode.hexeditor
                tal7aouy.icons
                jnoortheen.nix-ide
                wmaurer.change-case
                mesonbuild.mesonbuild
            ] ++  vscode-utils.extensionsFromVscodeMarketplace [
                {
                    name = "vscode-s-quirrel";
                    publisher = "mepsoid";
                    version = "0.0.7";
                    hash = "sha256-Gw+AjAnR/ei1lxCcXPSiQTzHFKe6f+DxBvPENZCvw1k=";
                }
                {
                    name = "dascript-plugin";
                    publisher = "profelis";
                    version = "1.1.44";
                    hash = "sha256-GqQDk12FMZih3HBl7pTNte9vhvfzQERV62NmWUlTSwU=";
                }
                {
                    name = "blk";
                    publisher = "eguskov";
                    version = "0.0.2";
                    hash = "sha256-m56gP+L2acRD0wUrc/xaaN//uvHktB1Aft2vu5KWXro=";
                }
                {
                    name = "blktool";
                    publisher = "eguskov";
                    version = "0.1.20";
                    hash = "sha256-fo/lGiUujGiHClp1Q+fM8MuuRQJp5mte9riFH7D0EvU=";
                }
            ];
        })
    ];
    shellHook = ''
        export PATH=:"$PATH:$PWD/../DagorDevtools"
        export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
    '';
}
