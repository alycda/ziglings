{ pkgs ? import <nixpkgs> {} }:

let
  zigpkgs = import (builtins.fetchTarball
    "https://github.com/mitchellh/zig-overlay/archive/main.tar.gz") { inherit pkgs; };
in

pkgs.mkShell {
  buildInputs = [
    zigpkgs.master
  ] ++ (with pkgs; [ just bacon cheat asciinema_3 presenterm tmux mdbook ]);
}
