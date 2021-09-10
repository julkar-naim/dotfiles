#!/bin/sh

# Author: Julkar Naim
# Description: A installation script after a clean linux install


echo "#########################################################"
echo "################### Installing AUR Helper ###############"
echo "#########################################################"


sudo pacman -S --noconfirm --needed  base-devel  git rust &&
git clone https://aur.archlinux.org/paru.git  &&
cd paru && makepkg -si --noconfirm && cd;


echo -e "\n############# Installing Development tools #############\n"

sudo pacman -S --noconfirm --needed nodejs clang gvim;

echo -e "\n############# Installing essentials #############\n"

sudo pacman -S --noconfirm --needed arc-gtk-theme arc-icon-theme albert xterm alsa alsa-utils android-tools android-udev arandr curl ffmpeg feh flameshot flac fontconfig fzf gnome-disk-utility gparted gzip unzip xf86-video-intel xf86-video-vesa xorg xorg-server gimp youtube-dl;

echo -e "\n############# Installing window manager stuffs #############\n"

sudo pacman -S --noconfirm --needed awesome lua-dkjson lua52-dkjson lua53-dkjson sxhkd;

echo -e "\n############# Installing file manager #############\n"

sudo pacman -S --noconfirm --needed ranger thunar thunar-volman udisks2 gvfs thunar-archive-plugin xarchiver;

echo -e "\n############# Installing fonts #############\n"

sudo pacman -S --noconfirm --needed ttf-dejavu ttf-fira-code ttf-hack ttf-inconsolata ttf-jetbrains-mono ttf-joypixels ttf-opensans ttf-wps-fonts;


echo "#########################################################"
echo "################### Everything is done    ###############"
echo "#########################################################"
