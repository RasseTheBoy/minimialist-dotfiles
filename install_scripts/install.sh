#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Enable bluetooth
echo "Enabling bluetooth..."
sudo systemctl enable --now bluetooth

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



# Keyd service
sudo pacman -S --noconfirm keyd
echo "Copying keyd config file..."
sudo mkdir -p /etc/keyd
sudo cp ../etc/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd


pacman_packages=(
  firefox
  neovim
  code  # Visual Studio Code
  fastfetch
  hyprpicker  # Colot picker
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
  fuzzel  # Application launcher

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
  udisks2 # Removable media automount
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
)

# Install packages (pacman)
echo "Installing packages (pacman)..."
for package in "${pacman_packages[@]}"; do
  sudo pacman -S --noconfirm --needed "$package"
done

# Install packages (AUR)
echo "Installing packages (AUR)..."
for package in "${yay_packages[@]}"; do
  yay -S --noconfirm "$package"
done






