#!/bin/bash
aur="paru"
$aur -S xmonad xmonad-contrib xmobar picom-jonaburg-git feh trayer-srg-git volumeicon dunst alacritty betterlockscreen fish mpd ncmpcpp mpc pulseaudio lxapperance qt5ct sweet-dark-theme

git clone "https://github.com/lostybtw/dotfiles.git" ~/.local/
mkdir ~/.local/scripts
git clone "https://github.com/lostybtw/change-wm-schemes" ~/.local/scripts
git clone "https://github.com/lostybtw/dmenu_scripts" ~/.local/scripts

dir="~/.local/dotfiles"
scripts_dir="~/.local/scripts"

cp -rf $dir/config/* ~/.config/ 

cp -rf $dir/.xmonad     ~/ 
cp -rf $dir/.vim/      ~/
cp -rf $dir/.vimrc    ~/

$scripts_dir/change-wm-schemes/apply.sh $dir/wallpapers/Koe_No_katachi.png
$scripts_dir/change-wm-schemes/apply-dmenu.sh $dir/dmenu

sudo cp -rf $scripts_dir/dmenu_scripts/* /usr/bin/
betterlockscreen -u $dir/wallpapers/Late_Night_Simple.jpg

xmonad --recompile

touch ~/.xinitrc
echo "xmonad" >> ~/.xinitrc
