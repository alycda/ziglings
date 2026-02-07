{ pkgs ? import <nixpkgs> {
    overlays = [
      (import (builtins.fetchTarball
        "https://github.com/mitchellh/zig-overlay/archive/main.tar.gz"))
    ];
  }
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    zigpkgs.master
    just cheat asciinema_3 presenterm tmux mdbook
  ];
}