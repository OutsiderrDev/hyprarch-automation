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
read -p "Press Enter to start the automated installation script"

sudo -v
while true; do sudo -n true; sleep 60; done 2>/dev/null &

#Installation of pacakges
sudo pacman -S --needed --noconfirm base-devel fish firefox neovim fastfetch discord wget qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg libreoffice-fresh

#Setting fish as default shell
sudo chsh -s /usr/bin/fish "$USER"

#Installation of yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -rf yay

#Installation of bottles
yay -S --needed --noconfirm bottles

#Default wallpaper
sudo mkdir -p /home/"$USER"/Pictures/wallpapers
sudo cp ./wallpapers/hyprarch.jpg /home/"$USER"/Pictures/wallpapers/hyprarch.jpg

#SDDM configuration
git clone https://github.com/JaKooLit/simple-sddm-2.git
sudo mv simple-sddm-2 /usr/share/sddm/themes/simple_sddm_2
sudo cp /home/"$USER"/Pictures/wallpapers/hyprarch.jpg /usr/share/sddm/themes/simple_sddm_2/Backgrounds/hyprarch.jpg
sudo mv ./configs/sddm.conf /etc/sddm.conf
sudo mv ./configs/theme.conf /usr/share/sddm/themes/simple_sddm_2/theme.conf

#Hyprland dotfiles
git clone https://github.com/end-4/dots-hyprland
cd dots-hyprland
sudo chmod +x ./install.sh
./install.sh

read -p "Press Enter to reboot"
sudo -k
reboot
