#!/usr/bin/env zsh
#
# Author: Akshay Mestry <xa@mes3.dev>
# Created on: 13 December, 2020
# Last updated on: 16 January, 2026
#
# This file contains most (if not all) of my Zsh configurations.

# Enable command completions
fpath=(/Users/xames3/.docker/completions $fpath)
autoload -Uz compinit; compinit

# Set environment variables
export PS1="%~ %% "
export HISTSIZE=10000
export SAVEHIST=10000
export HOMEBREW_NO_ENV_HINTS=TRUE
export PYENV_ROOT="$HOME/.pyenv"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude '*.swp'"
export EDITOR='vim'
export VISUAL='vim'

# Directory variables
export WORKSPACE=$HOME/Developer/Workspace
export TEACHING=$HOME/Developer/Teaching

# Check if `$PYENV_ROOT/bin` exists, if yes, prepend it to `$PATH`
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Aliases
alias ..='cd ..'
alias py='python3'
alias pip='python3 -m pip'
alias ls='ls -lAh --color=auto'
alias workspace='cd $WORKSPACE'
alias teaching='cd $TEACHING'
alias dy='docker run -ti -v $PWD:/root/ 225 python3'
alias refresh="osascript -e 'tell application \"Safari\" to tell front document to set URL to (get URL)'"
alias evimrc='vi ~/.vim/options.vim'
alias ezshrc='vi ~/.zshrc'
alias hl='rg --passthru'
alias ip='ipconfig getifaddr en0'
alias github='open-on-github'
alias 26='cd $WORKSPACE/2026'

# Utility functions
open-on-github() {
    local url repo
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
        echo "[ERROR] Not a git repository"
        return 1
    }
    url=$(git config --get remote.origin.url) || {
        echo "[ERROR] No origin remote found"
        return 1
    }

    case "$url" in
        git@github.com:*)
            repo=${url#git@github.com:}
            ;;
        https://github.com/*)
            repo=${url#https://github.com/}
            ;;
        *)
            echo "[ERROR] Origin is not a GitHub repo"
            return 1
            ;;
    esac

    repo=${repo%.git}
    open "https://github.com/$repo"
}
