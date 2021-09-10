#!/usr/bin/env sh

######################################################################
# @author      : naim (naim@unknown)
# @file        : config
# @created     : Friday Sep 10, 2021 19:00:00 +06
#
# @description : snippet for installing dotfiles
######################################################################


git clone --bare https://github.com/mznaim/dotfiles $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
