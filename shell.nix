with (import <nixpkgs> {  });
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
            ];
        })
    ];
    shellHook = ''
        export PATH=:"$PATH:$PWD/../DagorDevtools"
        export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
    '';
}
