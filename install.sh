#!/bin/bash
set -e

func_main(){
  echo "[INFO] Installing config files..."

  mkdir -p "$HOME/.config"
  cp -r ./config/* "$HOME/.config/"

  echo "[INFO] Installing pacman dependencies..."
  sudo pacman -S --needed --noconfirm \
    git base-devel kitty thunar hyprland rofi waybar swaybg \
    otf-font-awesome ttf-fira-code flatpak gdm

  if ! command -v yay >/dev/null 2>&1; then
    echo "[INFO] Installing yay..."
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
    cd ..
    rm -rf yay-bin
  fi

  echo "[INFO] Installing AUR packages..."
  yay -S --needed --noconfirm grimblast wl-clipboard brave-bin

  echo "[INFO] Installing GRUB theme..."
  if [ -d "./LainGrubTheme" ]; then
    rm -rf ./LainGrubTheme
  fi
  git clone --depth=1 https://github.com/uiriansan/LainGrubTheme
  cd LainGrubTheme
  sudo ./install.sh
  sudo ./patch_entries.sh
  cd ..

  echo "[INFO] Installing cursor theme..."
  mkdir -p "$HOME/.icons"
  cp -r ./Moga-White-Cursor "$HOME/.icons/"

  echo "[INFO] Enabling display manager..."
  sudo systemctl enable gdm

  echo "[DONE] Install finished. Select Hyprland on login."
}

func_main
