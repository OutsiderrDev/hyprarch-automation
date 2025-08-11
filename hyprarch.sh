#!/bin/bash
echo "
  _    _                                  _
 | |  | |                  /\            | |    
 | |__| |_   _ _ __  _ __ /  \   _ __ ___| |__  
 |  __  | | | | '_ \| '__/ /\ \ | '__/ __| '_ \ 
 | |  | | |_| | |_) | | / ____ \| | | (__| | | |
 |_|  |_|\__, | .__/|_|/_/    \_\_|  \___|_| |_|
          __/ | |                               
         |___/|_|                               
"
sudo -v
while true; do sudo -n true; sleep 60; done 2>/dev/null &
#Installation of pacakges
sudo pacman -S --needed --noconfirm base-devel zsh firefox neovim fastfetch discord wget qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg

#Setting zsh af default shell
sudo chsh -s /usr/bin/zsh "$USER"

#Installation of yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -rf yay

#Installation of bottles
yay -S --needed --noconfirm bottles

#Default wallpaper
sudo mkdir -p /home/"$USER"/Pictures/wallpapers/
sudo cp ./wallpapers/japan.jpg /home/"$USER"/Pictures/wallpapers/

#SDDM configuration
git clone https://github.com/JaKooLit/simple-sddm-2.git
sudo mv simple-sddm-2 /usr/share/sddm/themes/simple_sddm_2
sudo cp /home/"$USER"/Pictures/wallpapers/japan.jpg /usr/share/sddm/themes/simple_sddm_2/Backgrounds/
sudo mv ./sddm.conf /etc/sddm.conf

#Hyprland dotfiles
git clone https://github.com/end-4/dots-hyprland
cd dots-hyprland
sudo chmod +x ./install.sh
./install.sh

reboot
