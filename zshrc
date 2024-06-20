export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export GPG_TTY=$(tty)

ZSH_THEME="nicoulaj"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=( git zsh-vi-mode )

fpath=( $HOME/.zsh_completions $fpath )

zstyle ':omz:update' mode reminder  # remind me to update when available
source $ZSH/oh-my-zsh.sh
compinit

alias cdp='cd $(git rev-parse --show-toplevel)'
alias zg='zig build'

eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"
eval "$(zoxide init zsh --cmd cd)"
