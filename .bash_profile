#!/usr/bin/env bash
#
# Author: Akshay Mestry <xa@mes3.dev>
# Created on: 13 December, 2020
# Last updated on: 20 January, 2026
#
# This file contains setup that is executed when starting a "login shell". It's
# used to set up environment, such as defining user-specific environment
# variables and `PATH` variable, which determines where the system searchs for
# executable binaries.
#
# A few things to understand about `bash_profile`:
# - It runs just once upon logging into a system, such as starting a console
#   session or logging in via SSH.
# - It is the ideal place to export variables that should be available for the
#   entire session, such as `PATH`, `EDITOR`, etc.
# - A key difference between `.bashrc` and `.bash_profile` is, `.bashrc` runs
#   every time a new terminal window is opened, whereas `.bash_profile` runs
#   only once after system boot. Thus, it makes a lot of sense to put all the
#   heavy configurations, aliases, and functions in `.bashrc` and environment
#   variables in `.bash_profile`.
#
# NOTE.
# On macOS, the default `Terminal` application treats every new terminal window
# or tab as a login shell, simply put, it reads `.bash_profile` instead of the
# `.bashrc` for new sessions.

# Always load interactive config
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Add the Homebrew shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"
