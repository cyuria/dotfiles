export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export EDIT4TH="$EDITOR"
export GPG_TTY=$(tty)
export MANPAGER='nvim +Man!'
export MANWIDTH=999

ZSH_THEME="nicoulaj"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=( git zsh-vi-mode zsh-syntax-highlighting )

fpath=( $HOME/.zsh_completions $fpath )

zstyle ':omz:update' mode reminder  # remind me to update when available
source $ZSH/oh-my-zsh.sh
compinit

alias cdg='cd $(git rev-parse --show-toplevel)'
alias zg='zig build'

# thefuck has really slow load times so cache the output
if [[ -f "$HOME/.scripts/fuck.sh" ]]; then
    source $HOME/.scripts/fuck.sh
fi

eval "$(zoxide init zsh --cmd cd)"
