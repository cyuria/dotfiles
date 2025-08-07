export EDITOR='nvim'
export EDIT4TH="$EDITOR"
export GPG_TTY=$(tty)
export MANPAGER='nvim +Man!'

fpath=( $HOME/.local/share/zsh/completions $fpath )

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cdg='cd $(git rev-parse --show-toplevel || echo .)'

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source "$HOME/.zsh/antigen.zsh"
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply
