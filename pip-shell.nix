# shell.nix
{ pkgs ? import <nixpkgs> {} }:
let
  my-python-packages = p: with p; [
    jupyter
    pip
    virtualenv
  ];
  my-python = pkgs.python3.withPackages my-python-packages;
in pkgs.mkShell {
  packages = [
    pkgs.wget
    my-python
  ];
  shellHook = ''
    # Activate Python virtual environment
    source .venv/bin/activate
  '';
}