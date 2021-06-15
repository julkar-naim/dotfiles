#!/usr/bin/env sh

######################################################################
# @author      : naim (naim@Unknown)
# @file        : run
# @created     : Tuesday Jun 15, 2021 19:12:37 +06
#
# @description : post os configure script
######################################################################

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

echo ".cfg" >> .gitignore

git clone --bare <git-repo-url> $HOME/.cfg

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

config checkout

config config --local status.showUntrackedFiles no


