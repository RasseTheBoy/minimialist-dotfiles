#!/bin/bash
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

# Install packages (pacman)
echo "Installing packages (pacman)..."
sudo pacman -S --noconfirm --needed \
    git \
    github-cli \  # GitHub CLI
    lazygit \
    libnotify \  # Notifications
    firefox \
    neovim \
    code \  # Visual Studio Code
    fastfetch \
    hyprpicker \  # Colot picker
    keyd \  # Key remapping daemon
    bitwarden \
    piper \  # Logitech mouse daemon
    blueman \  # Bluetooth manager
    wl-clipboard \  # Wayland clipboard
    man \  # Manual pages
    btop \  # System monitor
    qbittorrent \  # Torrent client
    chezmoi \  # dotfiles manager
    pacman-contrib \  #  Required for `checkupdates`
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \

    # Themes
    gtk3-demos \
    gtk4-demos \
    gnome-themes-extra \

    # Fonts
    font-manager \
    noto-fonts \
    noto-fonts-emoji \
    ttf-droid \  # Required for vscode

    # Media
    udiskie udiskie2 \ # Removable media automount
    nemo \  # File manager
    nemo-fileroller \
    nemo-terminal \
    zathura \  # PDF/image viewer
    yazi \  # Terminal file manager
    unzip \
    zip \
    unrar \
    7zip \
    vlc \  # Media player

    # Gaming
    gamemode \
    lib32-gamemode \  # GameMode (32-bit)
    lib32-vulkan-radeon lib32-vulkan-icd-loader lib32-vulkan-mesa-layers \  # Vulkan (32-bit)
    gamescope


# Install packages (AUR)
echo "Installing packages (AUR)..."
yay -S --noconfirm --needed \
    min \  # Minimalistic web browser
    ente-auth-bin \  # Ente auth daemon
    flatseal \  # Flatpak permissions manager
    hyprshot \  # Hyprland screenshot tool
    hyprshade \  # Hyprland night light daemon
    selectdefaultapplication-git \  # See default applications
    zen-browser-bin  # Zen Browser (Firefox)




# Enable keyd service
echo "Copying keyd config file..."
sudo mkdir -p /etc/keyd
sudo cp ./etc/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd

