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
