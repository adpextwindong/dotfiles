{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "takumi";
  home.homeDirectory = "/home/takumi";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tmux
    ghc
    cabal2nix
    cabal-install
    nodejs # For coc-nvim
    haskellPackages.haskell-language-server

    (neovim.override {
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [ coc-nvim nerdtree];
          opt = [];
        };
        customRC = builtins.readFile ./nvim.vim;
      };
    })
  ];

  programs.git = {
    enable = true;

    userName = "Takumi Crary";
    userEmail = "tcrary@gmail.com";

    extraConfig = {
      core = {
        editor = "nvim";
      };
    };
  };

  programs.bash.shellAliases = {
    vim = "nvim";
  };

  home.file = {
    ".bashrc" = {
      text = ''
          PS1="\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\\w\[$(tput sgr0)\]\nλ \[$(tput sgr0)\]"
          [ -z "$TMUX" ] && { tmux -u attach || exec tmux -u new-session && exit;}
        '';
    };

    ".tmux.conf" = {
      text = ''
        set -g default-terminal "xterm"

        # General Configs
        setw -g xterm-keys

        # Increase history
        set -g history-limit 5000

        # -- Binds --------------------------------------------------------

        #GNU-Screen Compatible Prefix
        set -g prefix2 C-a
        bind C-a send-prefix -2

        # Edit Config
        bind e new-window -n "~/.tmux.conf.local" "sh -c '\${EDITOR:-vim} ~/.tmux.conf.local && tmux source ~/.tmux.conf && tmux display \"~/.tmux.conf sourced\"'"

        # Reload Config
        bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

        # Window Splitting
        # TODO Fix tmux splitting behavior with nix-shell


        bind - split-window -v -c "#{pane_current_path}"
        bind _ split-window -h -c "#{pane_current_path}"
        # Note: Make sure /etc/profile ~/.bash_profile ~/.bash_login and ~/.profile aren't yanking your chain
        # and cd'ing you to somewhere else if you want this to work.

        # Pane Navigation
        bind -r h select-pane -L  # move left
        bind -r j select-pane -D  # move down
        bind -r k select-pane -U  # move up
        bind -r l select-pane -R  # move right
        bind -r C-h resize-pane -L 5
        bind -r C-j resize-pane -D 5
        bind -r C-k resize-pane -U 5
        bind -r C-l resize-pane -R 5
        bind > swap-pane -D       # swap current pane with the next one
        bind < swap-pane -U       # swap current pane with the previous one
      '';
    };

  };

}
