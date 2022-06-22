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
  ];

  programs.git = {
    enable = true;

    userName = "Takumi Crary";
    userEmail = "tcrary@gmail.com";

    extraConfig = {
      core = {
        editor = "vim";
      };
    };
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nerdtree
    ];

    extraConfig = ''
      let mapleader=" "

      set tabstop=2
      set shiftwidth=2
      set expandtab

      syntax on
      set number
      set fileformat=unix

      set autoindent

      set splitbelow
      set splitright

      nnoremap <C-J> <C-W><C-J>
      nnoremap <C-K> <C-W><C-K>
      nnoremap <C-L> <C-W><C-L>
      nnoremap <C-H> <C-W><C-H>

      autocmd BufWritePre * %s/\s\+$//e
      autocmd BufWritePre * %s/\n\+\%$//e

      autocmd BufRead, BufNewFile {*.md} set filetype=markdown
      autocmd FileType markdown setlocal syntax=off

      set backspace=2

      " NERDTree

      nnoremap <leader>n :NERDTreeFocus<CR>
      nnoremap <C-n> :NERDTree<CR>
      nnoremap <C-t> :NERDTreeToggle<CR>
      nnoremap <C-f> :NERDTreeFind<CR>

      " Start NERDTree when Vim is started without file arguements
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

      " Misc keybinds

      nnoremap <C-v> :vsplit <cfile><CR>
    '';
  };

  home.file = {
    ".bashrc" = {
      text = ''
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
