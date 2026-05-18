#!/usr/bin/env bash
#
# Author: Akshay Mestry <xa@mes3.dev>
# Created on: 13 December, 2020
# Last updated on: 17 May, 2026
#
# This file contains most (if not all) of my bash-related configurations.

# =============================================================================
# Check if the session is running interactively
# =============================================================================
[[ -n $PS1 ]] || return

# =============================================================================
# Source bash completions
# =============================================================================
_brew_prefix="$(brew --prefix)"
if [[ -f "$_brew_prefix/etc/bash_completion" ]]; then
    source "$_brew_prefix/etc/bash_completion"
fi
unset _brew_prefix

# =============================================================================
# Set environment variables
# =============================================================================
export PS1="\[\e[38;5;81m\]\w\[\e[0m\] \[\e[38;5;41m\]\$\[\e[0m\] "
[[ "$PROMPT_COMMAND" != *autovenv* ]] && \
    export PROMPT_COMMAND="autovenv${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
declare -f update_terminal_cwd > /dev/null 2>&1 || update_terminal_cwd() { :; }
export HISTSIZE=10000
export HISTFILESIZE=10000
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
alias 225='docker run -ti -v "$PWD:/root/" --name 225 python'
alias refresh="osascript -e 'tell application \"Safari\" to tell front document to set URL to (get URL)'"
alias evimrc="vi ~/.vim/options.vim"
alias ebashrc="vi ~/.bashrc"
alias sbashrc="source ~/.bashrc"
alias hl="rg --passthru"
alias ip="ipconfig getifaddr en0"
alias update="brew update && brew upgrade"
alias downloads="cd $DOWNLOADS"
alias workspace="cd $WORKSPACE"
alias teaching="cd $TEACHING"
alias 26="cd $WORKSPACE/2026"
alias dotfiles="cd $WORKSPACE/2026/dotfiles"
alias website="cd $WORKSPACE/2026/website"

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
    local OPTIND=1
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

venvpath() {
    usage() {
        printf "venvpath: venvpath [-h]\n"
        printf "    Find the path to the nearest Python virtual environment.\n\n"
        printf "    Walks up from the list of virtual environment directories. Prints the\n"
        printf "    absolute path of the first one found, or nothing if none is found.\n\n"
        printf "    Options:\n"
        printf "      -h        Show this help and exit\n\n"
        printf "    Exit Status:\n"
        printf "    Returns 0 if a virtual environment is found, 1 otherwise.\n"
    }

    local dir="$PWD"
    local names=("venv2" "env2" ".venv" "venv" "env")

    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        usage
        return 0
    fi

    while [[ "$dir" != "/" ]]; do
        for name in "${names[@]}"; do
            if [[ -f "$dir/$name/bin/activate" && -x "$dir/$name/bin/python3" ]]; then
                return 0
            fi
        done
        dir="$(dirname "$dir")"
    done
    return 1
}

autovenv() {
    usage() {
        printf "autovenv: autovenv [-h]\n"
        printf "    Automatically activate or deactivate Python virtual environments.\n\n"
        printf "    Searches for a virtual environment in the current directory tree using\n"
        printf "    venvpath. Activates the environment if one is found and not already\n"
        printf "    active. Deactivates the current environment when navigating away from\n"
        printf "    its directory tree. Respects manual deactivation: running deactivate\n"
        printf "    suppresses re-activation until you leave and re-enter the directory.\n\n"
        printf "    This function is normally invoked automatically via PROMPT_COMMAND\n"
        printf "    and does not need to be called directly.\n\n"
        printf "    Options:\n"
        printf "      -h        Show this help and exit\n\n"
        printf "    Exit Status:\n"
        printf "    Returns 0 always.\n"
    }

    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        usage
        return 0
    fi

    local path
    path="$(venvpath)"

    if [[ -n "$ACTIVE_VENV" ]]; then
        if [[ -z "$path" || "$path" != "$ACTIVE_VENV" ]]; then
            deactivate 2>/dev/null
            unset ACTIVE_VENV
            unset AUTOVENV_SKIP
        elif [[ -z "$VIRTUAL_ENV" ]]; then
            AUTOVENV_SKIP="$ACTIVE_VENV"
            unset ACTIVE_VENV
            return 0
        fi
    fi

    [[ -n "$AUTOVENV_SKIP" && "$path" != "$AUTOVENV_SKIP" ]] && unset AUTOVENV_SKIP

    if [[ -z "$VIRTUAL_ENV" && -n "$path" && "$path" != "${AUTOVENV_SKIP-}" ]]; then
        source "$path/bin/activate"
        ACTIVE_VENV="$path"
    fi
}

cd() {
    builtin cd "$@" || return
    autovenv
}

github() {
    usage() {
        printf "github: github [-hv] [-a application]\n"
        printf "    Open the current git repository on GitHub.\n\n"
        printf "    Check if the current directory is a valid git repository. If\n"
        printf "    it is, open the repository page in the default browser.\n\n"
        printf "    Only GitHub-hosted repositories are supported.\n\n"
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
        printf "star: star [-hr] [-c char] [-s start] [-a align] rows\n"
        printf "    Print a (right-angled) triangular pattern of characters.\n\n"
        printf "    Prints ROWS rows where the i-th row contains i repetitions of CHAR,\n"
        printf "    building a triangle from START up to ROWS (or descending with -r).\n\n"
        printf "    Options:\n"
        printf "      -a        Alignment: left (default) or right\n"
        printf "      -c        Character to fill the triangle with (default: *)\n"
        printf "      -h        Show this help and exit\n"
        printf "      -r        Reverse: print a descending triangle\n"
        printf "      -s        Row to start from (default: 1)\n\n"
        printf "    Exit Status:\n"
        printf "    Returns 0 on success, 1 if an argument is missing, not a positive\n"
        printf "    integer, or an invalid option is given.\n"
    }

    local character="*"
    local startfrom=1
    local reverse=false
    local align="left"

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            -a|--align)
                case "$2" in
                    left|right) align="$2" ;;
                    *) error "invalid alignment -- $2 (choose: left, right)" ; return 1 ;;
                esac
                shift 2
                ;;
            -c|--character)
                character="$2"
                shift 2
                ;;
            -h|--help)
                usage
                return 0
                ;;
            -r|--reverse)
                reverse=true
                shift
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
    [[ $startfrom =~ ^[1-9][0-9]*$ ]] || { error "invalid argument for start -- $startfrom" ; return 1 ; }
    [[ "$n" =~ ^[1-9][0-9]*$ ]] || { error "invalid number of rows -- $n" ; return 1 ; }
    [[ "$startfrom" -le "$n" ]] || { error "start ($startfrom) exceeds rows ($n)" ; return 1 ; }

    local row seq_args
    $reverse && seq_args="$n -1 $startfrom" || seq_args="$startfrom $n"

    for row in $(seq $seq_args); do
        if [[ "$align" == "right" ]]; then
            printf "%${n}s\n" "$(printf "%${row}s" | tr ' ' "$character")"
        else
            printf "%${row}s\n" | tr ' ' "$character"
        fi
    done
}

spock() {
    usage() {
        printf "spock: spock [-h] [-s] [-l] [-n count] [-v] [-r]\n"
        printf "    Add spacer tiles to the macOS Dock.\n\n"
        printf "    This adds a transparent, app-like spacer to the macOS Dock. It does not\n"
        printf "    affect any currently opened apps or existing Dock apps. The Dock is\n"
        printf "    restarted automatically to apply the change. The default behaviour is\n"
        printf "    to add 1 small spacer tile.\n\n"
        printf "    Options:\n"
        printf "      -h        Show this help and exit\n"
        printf "      -l        Use large spacer tile\n"
        printf "      -n        Number of tiles to add (default: 1)\n"
        printf "      -r        Remove all existing spacer tiles and restart the Dock\n"
        printf "      -s        Use small spacer tile (default)\n"
        printf "      -v        Use verbose output\n\n"
        printf "    Exit Status:\n"
        printf "    Returns 0 on success, 1 if an invalid option is given or an\n"
        printf "    error occurs.\n"
    }

    local tile="small-spacer-tile"
    local count=1
    local verbose=false
    local remove=false

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
            -r|--remove)
                remove=true
                shift
                ;;
            -s|--small)
                tile="small-spacer-tile"
                shift
                ;;
            -v|--verbose)
                verbose=true
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

    if $remove; then
        $verbose && printf "removing all spacer tiles from Dock\n"
        local plist="$HOME/Library/Preferences/com.apple.dock.plist"
        local i count_apps type removed=0
        count_apps=$(/usr/libexec/PlistBuddy -c "Print :persistent-apps" "$plist" 2>/dev/null \
            | grep -c "Dict")
        for ((i = count_apps - 1; i >= 0; i--)); do
            type=$(/usr/libexec/PlistBuddy \
                -c "Print :persistent-apps:${i}:tile-type" "$plist" 2>/dev/null)
            if [[ "$type" == "spacer-tile" || "$type" == "small-spacer-tile" ]]; then
                /usr/libexec/PlistBuddy -c "Delete :persistent-apps:${i}" "$plist"
                ((removed++))
                $verbose && printf "removed %s at index %d\n" "$type" "$i"
            fi
        done
        $verbose && printf "removed %d spacer tile(s)\n" "$removed"
        killall Dock
        return 0
    fi

    [[ $count =~ ^[1-9][0-9]*$ ]] || { error "invalid argument for number -- $count" ; return 1 ; }
    $verbose && printf "adding %d %s(s) to Dock\n" "$count" "$tile"
    local i
    for i in $(seq 1 "$count"); do
        defaults write com.apple.dock persistent-apps -array-add \
            "{\"tile-type\"=\"$tile\";}"
    done
    killall Dock
}
