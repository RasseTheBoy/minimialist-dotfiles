# SDDM theme (login screen)

Easy to follow guide on how to install a custom theme for SDDM.

## Installation

Install the theme

```bash
git clone https://github.com/stepanzubkov/where-is-my-sddm-theme.git
cd where-is-my-sddm-theme
sudo ./install.sh
```

Create a config file for sddm

```bash
sudo sddm --example-config | sudo tee /etc/sddm.conf
```

Change the default theme

```bash
sudoedit /etc/sddm.conf
```

```ini
[Theme]
Current=where-is-my-sddm-theme
```

Restart the sddm service

```bash
sudo systemctl restart sddm
```

## More information

- [https://github.com/sddm/sddm](https://github.com/sddm/sddm)
- [https://github.com/stepanzubkov/where-is-my-sddm-theme](https://github.com/stepanzubkov/where-is-my-sddm-theme)
