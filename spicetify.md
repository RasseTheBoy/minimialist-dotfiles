# Spicetify

## Installation

First install Spotify using pacman.

```bash
yay -S spotify-edge
```

Give write permission to spotify files

```bash
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
```

### BEFORE CONTINUING

Launch once and login to make sure everything is working.

### Install Spicetify

```bash
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
spicetify backup apply
```

### Install Amoledify theme

Go to theme directory

```bash
cd "$(dirname "$(spicetify -c)")/Themes"
```

Download and apply the theme

```bash
git clone https://github.com/RasseTheBoy/Amoledify.git
spicetify config inject_css 1 replace_colors 1
spicetify config current_theme Amoledify
spicetify apply
```
