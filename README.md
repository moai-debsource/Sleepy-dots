#!/bin/bash
set -e

func_main(){
echo "[INFO] Installing config files..."

mkdir -p "$HOME/.config"

for dir in ./config/*; do
name="$(basename "$dir")"
if [ -e "$HOME/.config/$name" ]; then
echo "[INFO] Removing existing $name config..."
rm -rf "$HOME/.config/$name"
fi
cp -r "$dir" "$HOME/.config/"
done

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
rm -rf ./LainGrubTheme
git clone --depth=1 https://github.com/uiriansan/LainGrubTheme
cd LainGrubTheme
sudo ./install.sh
sudo ./patch_entries.sh
cd ..

echo "[INFO] Installing cursor theme..."
mkdir -p "$HOME/.icons"
rm -rf "$HOME/.icons/Moga-White-Cursor"
cp -r ./Moga-White-Cursor "$HOME/.icons/"

echo "[INFO] Enabling display manager..."
sudo systemctl enable gdm

echo "[DONE] Install finished. Reboot and select Hyprland."
}

func_main
