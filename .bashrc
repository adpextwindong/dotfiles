# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.2-4

# ~/.bashrc: executed by bash(1) for interactive shells.


PS1="\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\\w\[$(tput sgr0)\]\nλ \[$(tput sgr0)\]"

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

#My TODO convention in markdown for directions to be preceeded with '>' and research questions with '?'
alias todos="grep -r '^>' *.md ."
alias todosr="grep -r '^?' *.md ."
alias todaynote="vim $(date | awk '{print $2 substr($3, 1, length($3)-1) ".md"}')"
alias lsd="ls -d */"
alias gfgp="git fetch; git pull"
alias gfgpSUBDIRS="ls | xargs -P10 -I{} git -C {} fetch; ls | xargs -P10 -I{} git -C {} pull"

#alias sumatra="/cygdrive/c/Users/takumi/AppData/Local/SumatraPDF/SumatraPDF.exe"

EDITOR="/usr/bin/vim"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

eval $(ssh-agent)

[ -z "$TMUX" ] && { tmux -u attach || exec tmux -u new-session && exit;}
