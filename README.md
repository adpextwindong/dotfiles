# dotfiles

## NixOS 21.11 Virtualbox image

Install [home-manager](https://nix-community.github.io/home-manager/index.html#ch-installation)

```shell
 nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
 nix-channel --update

 export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

 nix-shell '<home-manager>' -A install
```

Copy .config/nixpkgs/home.nix to ~/.config/nixpkgs/home.nix

Run `home-manager switch`

## Packages
vim
tmux
git
