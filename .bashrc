#!/usr/bin/env bash
#
# Author: Akshay Mestry <xa@mes3.dev>
# Created on: 13 December, 2020
# Last updated on: 13 May, 2026
#
# This file contains most (if not all) of my bash-related configurations.

# =============================================================================
# Check if the session is running interactively
# =============================================================================
[[ -n $PS1 ]] || return

# =============================================================================
# Source bash completions
# =============================================================================
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# =============================================================================
# Set environment variables
# =============================================================================
export PS1="\[\e[38;5;81m\]\w\[\e[0m\] \[\e[38;5;41m\]\$\[\e[0m\] "
export PROMPT_COMMAND="autovenv${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
export HISTSIZE=10000
export SAVEHIST=10000
export HOMEBREW_NO_ENV_HINTS=TRUE
export PYENV_ROOT="$HOME/.pyenv"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude '*.swp'"
export EDITOR="vim"
export VISUAL="vim"
export TERM="xterm-256color"

# Directory variables
export DEVELOPER=$HOME/Developer
export WORKSPACE=$HOME/Developer/Workspace
export TEACHING=$HOME/Developer/Teaching
export DOWNLOADS=$HOME/Downloads

# Check if `$PYENV_ROOT/bin` exists, if yes, prepend it to `$PATH`
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# =============================================================================
# Aliases
# =============================================================================
alias cd..="cd .."
alias py="python3"
alias cp="cp -v"
alias mv="mv -v"
alias pip="python3 -m pip"
alias ls="ls -gohFAt --color=auto"
alias downloads="cd $DOWNLOADS"
alias workspace="cd $WORKSPACE"
alias teaching="cd $TEACHING"
alias dy="docker run -ti -v $PWD:/root/ 225 python3"
alias refresh="osascript -e 'tell application \"Safari\" to tell front document to set URL to (get URL)'"
alias evimrc="vi ~/.vim/options.vim"
alias ebashrc="vi ~/.bashrc"
alias sbashrc="source ~/.bashrc"
alias hl="rg --passthru"
alias ip="ipconfig getifaddr en0"
alias github="ghub"
alias 26="cd $WORKSPACE/2026"
alias dotfiles="cd $WORKSPACE/2026/dotfiles"
alias website="cd $WORKSPACE/2026/website"
alias update="brew update && brew upgrade"

# =============================================================================
# Utility functions
# =============================================================================

# error: error [arg ...]
#
# Print error message to stderr.
#
# This function displays the ARGs (error message), separated by a single space
# and followed by a newline, on the stderr with script name and the calling
# function name or command.
#
# Options:
#     -e    show only the error message
#
# Exit Status:
# The return code is always non-zero (1), indicating an error in execution.
error() {
    local options
    local only=false
    local this="${BASH_SOURCE[1]##*/}"
    local func="${FUNCNAME[1]}"

    while getopts ":e" options; do
        case "$options" in
            e) only=true ;;
            *) printf "error: invalid option -- %s\n" "$OPTARG" >&2 && return 1 ;;
        esac
    done

    shift $((OPTIND - 1))
    local emsg="$*"

    if $only; then
        printf "%s\n" "$emsg" >&2
    else
        printf "%s: %s: %s\n" "$this" "$func" "$emsg" >&2
    fi

    return 1
}

# venvpath
#
# Find if virtualenv is located in the directory.
# Print error message to stderr.
#
# This function displays the ARGs (error message), separated by a single space
# and followed by a newline, on the stderr with script name and the calling
# function name or command.
#
# Options:
#     -e    show only the error message
#
# Exit Status:
# The return code is always non-zero (1), indicating an error in execution.
venvpath() {
    local dir="$PWD"

    while [[ "$dir" != "/" ]]; do
        for name in .venv venv env; do
            if [[ -f "$dir/$name/bin/activate" ]]; then
                echo "$dir/$name"
                return
            fi
        done
        dir="$(dirname "$dir")"
    done
}

autovenv() {
    local path
    path="$(venvpath)"

    if [[ -n "$ACTIVE_VENV" ]]; then
        if [[ -z "$path" || "$path" != "$ACTIVE_VENV" ]]; then
            deactivate 2>/dev/null
            unset ACTIVE_VENV
        fi
    fi

    if [[ -z "$VIRTUAL_ENV" && -n "$path" ]]; then
        source "$path/bin/activate"
        ACTIVE_VENV="$path"
    fi
}

cd() {
    builtin cd "$@" || return
    autovenv
}

ghub() {
    usage() {
        printf "ghub: ghub [-hv] [-a application]\n"
        printf "    Open the current git repository on GitHub.\n\n"
        printf "    This function checks if the current directory is a valid git repository. If\n"
        printf "    it is, it extracts the remote origin URL and opens the repository page in\n"
        printf "    the default browser. Only GitHub-hosted repositories are supported.\n\n"
        printf "    Options:\n"
        printf "      -a        Application to launch to open GitHub repository\n"
        printf "      -h        Show this help and exit\n"
        printf "      -v        Use verbose output\n\n"
        printf "    The default behaviour is to open the GitHub repository in the default\n"
        printf "    browser. Available browsers are Safari (default), Microsoft Edge, and\n"
        printf "    Chrome.\n\n"
        printf "    Exit Status:\n"
        printf "    Returns 0 on success, 1 if the directory is not a git repository, has no\n"
        printf "    origin remote, or the remote is not hosted on GitHub.\n"
        return 0
    }

    local browser="Safari"
    local url repo

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            -a|--application)
                case "$2" in
                    Safari|Microsoft\ Edge|Chrome) browser="$2" ;;
                    *) error "unsupported browser -- $2 (choose: Safari, Microsoft Edge, Chrome)" ; return 1 ;;
                esac
                shift 2
                ;;
            -h|--help)
                usage
                return 0
                ;;
            -v|--verbose)
                local verbose=1
                shift
                ;;
            *)
                error "invalid option -- $1"
                return 1
                ;;
        esac
    done

    git rev-parse --is-inside-work-tree >/dev/null 2>&1 \
        || { error "not a git repository" ; return 1 ; }
    url=$(git config --get remote.origin.url) \
        || { error "no origin remote found" ; return 1 ; }
    case "$url" in
        git@github.com:*)     repo=${url#git@github.com:} ;;
        https://github.com/*) repo=${url#https://github.com/} ;;
        *)                    error "repository is not hosted on GitHub" ; return 1 ;;
    esac

    url="https://github.com/${repo%.git}"
    if [[ $verbose == 1 ]]; then
        echo "opening $url on $browser"
    fi
    open -a "$browser" "$url"
}

star() {
    usage() {
        printf "star: star [-h] [-c character] [-s start] [rows]\n"
        printf "    Print a (right-angled) triangular pattern of character.\n\n"
        printf "    This function prints 'n' rows where the i-th row contains i characters,\n"
        printf "    building a right-aligned triangle of the digit 'start' up to width 'n'.\n\n"
        printf "    Options:\n"
        printf "      -c        Character in the triangle\n"
        printf "      -h        Show this help and exit\n"
        printf "      -s        Triangle to start from\n\n"
        printf "    Exit Status:\n"
        printf "    Returns 0 on success, 1 if the argument is missing or not a positive\n"
        printf "    integer.\n"
    }

    local character="*"
    local startfrom=1

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            -c|--character)
                character=$2
                shift 2
                ;;
            -h|--help)
                usage
                return 0
                ;;
            -s|--start)
                startfrom="$2"
                shift 2
                ;;
            -*)
                error "invalid option -- $1"
                return 1
                ;;
            *)
                break
                ;;
        esac
    done

    local n="$1"
    [[ -z "$n" ]] && { error "missing operand" ; return 1 ; }
    [[ $startfrom =~ ^[0-9]+$ ]] || { error "invalid argument for start -- $1" ; return 1 ; }
    [[ "$n" =~ ^[0-9]+$ ]] || { error "invalid width -- $n" ; return 1 ; }

    local i
    for i in $(seq $startfrom "$1"); do
        printf "%*s\n" "$i" | tr " " "$character"
    done
}

spock() {
    usage() {
        printf "spock: spock [-h] [-s] [-l] [-n]\n"
        printf "    Add space tiles to the macOS dock.\n\n"
        printf "    This adds a transparent, app-like spacer to the macOS dock.\n"
        printf "    It doesn't affect any currently opened apps or existing docks\n"
        printf "    apps. The dock is restarted automatically to apply the change.\n"
        printf "    The default behaviour is to add 1 small space space unless otherwise.\n\n"
        printf "    Options:\n"
        printf "    -h          Show this help and exit\n"
        printf "    -l          Use large space tile\n"
        printf "    -n          Number of tiles to add\n"
        printf "    -s          Use small space tiles\n\n"
        printf "    Exit Status:\n"
        printf "    Returns 0 on success, 1 if an invalid option is given or an\n"
        printf "    error occurs.\n"
    }

    local tile="spacer-tile"
    local count=1

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            -h|--help)
                usage
                return 0
                ;;
            -l|--large)
                tile="spacer-tile"
                shift
                ;;
            -n|--number)
                count="$2"
                shift 2
                ;;
            -s|--small)
                tile="small-spacer-tile"
                shift
                ;;
            -*)
                error "invalid option -- $1"
                return 1
                ;;
            *)
                break
                ;;
        esac
    done

    [[ $count =~ ^[0-9]+$ ]] || { error "invalid argument for number -- $1" ; return 1 ; }
    local i
    echo $tile
    for i in $(seq 1 "$count"); do
        defaults write com.apple.dock persistent-apps -array-add \
            "{\"tile-type\"=\"$tile\";}"
    done
    killall Dock
}
