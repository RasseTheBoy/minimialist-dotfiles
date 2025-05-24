# How to install Steam

## 1. Edit pacman config file

`sudo nvim /etc/pacman.conf`

Uncomment the following line:

```conf
[multilib]
Include = /etc/pacman.d/mirrorlist
```

## 2. Update pacman

`sudo pacman -Syu`

## 3. Install Steam

`sudo pacman -S steam`

## 4. Reboot and run Steam

`reboot`

\*after reboot\*

`steam`

## Optional

```bash
sudo pacman -Syu \
    gamemode
    lib32-gamemode  # GameMode (32-bit)
    lib32-vulkan-radeon lib32-vulkan-icd-loader lib32-vulkan-mesa-layers \  # Vulkan (32-bit)
    gamescope
```
