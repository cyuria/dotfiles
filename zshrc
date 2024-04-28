alias rlsh="clear && exec \"$SHELL\""
alias motd="fortune -a | sed ':a;N;\$!ba;s/([^\n])\n/\\\\1 /g;s/  / /g' | cowsay -W $(expr 3 \* $(tput cols) \/ 4 \- 2) -f \$(ls /usr/share/cowsay/cows | sort -R | head -1) | lolcat"
motd

export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

ZSH_THEME="nicoulaj"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=( git zsh-vi-mode )

fpath=( $HOME/.zsh_completions $fpath )

zstyle ':omz:update' mode reminder  # remind me to update when available
source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)
