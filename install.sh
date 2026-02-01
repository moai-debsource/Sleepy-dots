#!/bin/bash

func_main(){
  echo "[INFO] Moving config directories in config folder.."
  cp -r config/* ~/.config
  echo "[INFO] Installing Dependencies.."
  sudo pacman -S swaybg git kitty thunar hyprland rofi waybar swaybg base-devel otf-font-awesome nerd-fonts ttf-fira-code flatpak --noconfirm --needed 
  echo -n "Do you have yay installed? (Y/N): "
  read option
  
  if [[ "$option" == "y"  ]]; then
    true
  elif [[ "$option" == "n"  ]]; then
    git clone https://aur.archlinux.org/yay-bin.git; cd yay-bin; makepkg -si; cd ..; rm -rf yay-bin
    true
  else
    echo "Invalid option; aborting.."
    exit
  fi
  
  yay -S grimblast wl-clipboard brave-bin
  echo "[INFO] Dependencies installed.."
  echo "[INFO] Installing grub theme.."
  git clone --depth=1 https://github.com/uiriansan/LainGrubTheme && cd LainGrubTheme && ./install.sh && ./patch_entries.sh; cd ..; rm -rf LainGrubTheme
  echo "[INFO] Grub theme installed.."
  echo "[INFO] Installing cursor.."
  mkdir -p ~/.icons
  mv Moga-White-Cursor ~/.icons
  echo "[INFO] Installing display manager.."
  sudo pacman -S gdm --needed --noconfirm; sudo systemctl enable gdm
  echo "[Installation] Finished installation! select hyprland at boot login."
}

func_main
