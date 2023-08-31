#!/usr/bin/env zsh
#
# Author: Akshay Mestry <xa@mes3.dev>
# Created on: 13 December, 2020
# Last updated on: 20 January, 2026
#
# This file contains most (if not all) of my zsh configurations.

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
alias 26='cd $WORKSPACE/2026'
