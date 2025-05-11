with (import <nixpkgs> { });
let
  EASTL = pkgs.callPackage ./packages/eastl.nix { };
  mumhash = pkgs.callPackage ./packages/hash/mumhash.nix { };
  murmurhash = pkgs.callPackage ./packages/hash/murmurhash.nix { };
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
    cmake
    pkg-config

    # 3rd-party libs
    EASTL
    mumhash
    murmurhash
  ];

  packages = [
    nixpkgs-fmt
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cpptools
        ms-vscode.hexeditor
        tal7aouy.icons
        jnoortheen.nix-ide
        wmaurer.change-case
        mesonbuild.mesonbuild
      ] ++ vscode-utils.extensionsFromVscodeMarketplace [
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
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
  '';
}
