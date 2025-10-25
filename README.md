# mydotfiles
dotfiles for my fedora rice

## Run the following commands to setup

```bash
sudo dnf copr enable solopasha/hyprland 
sudo dnf copr enable lukenukem/asus-linux 
sudo dnf install fastfetch hyprland hypridle hyprlock xdg-desktop-portal-hyprland swww asusctl asusctl-rog-gui kitty grimshot rust cargo wallust cliphist rofi wlogout zsh 
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
stow .
mkdir ~/Pictures/backgrounds
```
Note: for background selector and random wallpaper change to work please put wallpapers in ~/Pictures/backgrounds folder

### Optional downloads
```bash
sudo dnf install flatpak vscode bottles
flatpak install flathub com.github.tchx84.Flatseal com.spotify.Client com.valvesoftware.Steam dev.vencord.Vesktop md.obsidian.Obsidian
```

