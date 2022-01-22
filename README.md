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

## Cygwin

'./.bashrc' -> '/home/Takumi//.bashrc'

'./.bash_profile' -> '/home/Takumi//.bash_profile'

'./.inputrc' -> '/home/Takumi//.inputrc'

'./.profile' -> '/home/Takumi//.profile'

### Packages

wget
curl
lynx
openSSH
vim
