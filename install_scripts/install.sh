#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install yay (Yet Another Yogurt - AUR helper)
if ! command -v yay &>/dev/null; then
  echo "Installing yay..."
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit
  makepkg -si
  cd ..
  rm -rf yay
else
  echo "yay is already installed."
fi


# Update system
echo "Updating system..."
sudo pacman -Syu --noconfirm


pacman_packages=(
  firefox
  neovim
  code  # Visual Studio Code
  fastfetch
  hyprpicker  # Colot picker
  keyd  # Key remapping daemon
  bitwarden
  piper  # Logitech mouse daemon
  blueman  # Bluetooth manager
  wl-clipboard  # Wayland clipboard
  man  # Manual pages
  btop  # System monitor
  qbittorrent  # Torrent client
  chezmoi  # dotfiles manager
  pacman-contrib  #  Required for `checkupdates`
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk
  kanshi  # Multi monitor profiles
  pavucontrol  # Volume control (pulseaudio)
  scrcpy

  # Git
  git
  github-cli
  lazygit

  # Notifications
  libnotify # Notifications (notify-send)
  swaync # Notification daemon

  # Language tools
  languagetool
  nuspell  # Used by libreoffice

  # Themes
  gtk3-demos
  gtk4-demos
  gnome-themes-extra

  # Fonts
  font-manager
  noto-fonts
  noto-fonts-emoji
  ttf-droid  # Required for vscode

  # Files
  udiskie udiskie2 # Removable media automount
  nemo  # File manager
  nemo-fileroller
  nemo-terminal
  zathura  # PDF/image viewer
  yazi  # Terminal file manager
  unzip
  zip
  unrar
  7zip
  libreoffice-fresh
  libreoffice-fresh-en-gb

  # Media
  vlc  # Media player
  bluez
  bluez-utils

  # Gaming
  gamemode
  lib32-gamemode  # GameMode (32-bit)
  lib32-vulkan-radeon lib32-vulkan-icd-loader lib32-vulkan-mesa-layers \  # Vulkan (32-bit)
  gamescope
)


yay_packages=(
  # Web browsers
  zen-browser-bin  # Moddable firefox
  min  # Minimalistic web browser

  # Other
  ente-auth-bin  # Ente auth daemon
  flatseal  # Flatpak permissions manager
  hyprshot  # Hyprland screenshot tool
  hyprshade  # Hyprland night light daemon
  selectdefaultapplication-git  # See default applications
  betterbird-bin  # Email client
  voikko-libreoffice # Finnish spell checking for libreoffice

  # Discord
  discord
  openasar-git
  legcord-git
)

# Install packages (pacman)
echo "Installing packages (pacman)..."
sudo pacman -S --noconfirm --needed "${pacman_packages[@]}"


# Install packages (AUR)
echo "Installing packages (AUR)..."
yay -S --noconfirm --needed "${yay_packages[@]}"


# Keyd service
echo "Copying keyd config file..."
sudo mkdir -p /etc/keyd
sudo cp ../etc/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd


# Foot wrapper
echo "Copying foot wrapper..."
sudo cp ../bin/foot-wrapper.fish /usr/local/bin/

# Enable bluetooth
echo "Enabling bluetooth..."
sudo systemctl enable --now bluetooth
