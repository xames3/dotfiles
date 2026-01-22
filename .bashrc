#!/usr/bin/env bash
#
# Author: Akshay Mestry <xa@mes3.dev>
# Created on: 13 December, 2020
# Last updated on: 20 January, 2026
#
# This file contains most (if not all) of my bash-related configurations.

# =============================================================================
# Check if the session is running interactively
# =============================================================================
[[ -n $PS1 ]] || return

# =============================================================================
# Set environment variables
# =============================================================================
export PS1='\[\e[38;5;39m\]\w\[\e[0m\] \[\e[38;5;41m\]\$\[\e[0m\] '
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
eval "$(pyenv init - bash)"

# =============================================================================
# Aliases
# =============================================================================
alias ..='cd ..'
alias py='python3'
alias cp='cp -v'
alias mv='mv -v'
alias pip='python3 -m pip'
alias ls='ls -lAFh --color=auto'
alias workspace='cd $WORKSPACE'
alias teaching='cd $TEACHING'
alias dy='docker run -ti -v $PWD:/root/ 225 python3'
alias refresh="osascript -e 'tell application \"Safari\" to tell front document to set URL to (get URL)'"
alias evimrc='vi ~/.vim/options.vim'
alias ebashrc='vi ~/.bashrc'
alias sbashrc='source ~/.bashrc'
alias hl='rg --passthru'
alias ip='ipconfig getifaddr en0'
alias github='open-on-github'
alias 26='cd $WORKSPACE/2026'

# =============================================================================
# Utility functions
# =============================================================================

# error() - Prints an error message.
#
# This function prints error messages to stderr with script name and the
# calling function name or command.
#
# Arguments:
#   $1 = Error message to be printed.
#
# Returns:
#   1 - Always returns 1 to indicate an error.
#
# Example:
#   error "Something went wrong, try again."
error() {
    local this="${BASH_SOURCE[1]}"
    local func="${FUNCNAME[1]}"

    printf "%s: %s: %s\n" "$this" "$func" "$1" >&2
    return 1
}

# open-on-github() - Opens the current git repository on GitHub
#
# This function checks if the current directory is a valid git repository. If
# it is, it extracts the repository URL and opens it on GitHub. If the
# repository is not valid or there is no origin remote, an error message is
# displayed.
#
# Arguments:
#   None
#
# Returns:
#   0 - If the repository is successfully opened on GitHub.
#   1 - If the directory is not a valid git repository.
#
# Example:
#   open-on-github
open-on-github() {
    local url repo

    git rev-parse --is-inside-work-tree >/dev/null 2>&1 \
        || error "Not a git repository" || return
    url=$(git config --get remote.origin.url) \
        || error "No origin remote found" || return

    case "$url" in
        git@github.com:*)
            repo=${url#git@github.com:}
            ;;
        https://github.com/*)
            repo=${url#https://github.com/}
            ;;
        *)
            error "This repository is not hosted on GitHub"
            return
            ;;
    esac

    repo=${repo%.git}
    open "https://github.com/$repo"
}
