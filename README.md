# mydotfiles
dotfiles for my fedora rice

## Run the following commands to setup

```bash
sudo dnf copr enable solopasha/hyprland 
sudo dnf copr enable lukenukem/asus-linux 
sudo dnf copr enable materka/wallust
sudo dnf install fastfetch cava hyprland hypridle hyprlock xdg-desktop-portal-hyprland swww jetbrains-mono-fonts asusctl asusctl-rog-gui kitty grimshot rust cargo wallust cliphist rofi wlogout zsh blueman blueman-applet playerctl
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
stow .
```

### Optional downloads
```bash
sudo dnf install flatpak vscode bottles
flatpak install flathub com.github.tchx84.Flatseal com.spotify.Client com.valvesoftware.Steam dev.vencord.Vesktop md.obsidian.Obsidian
```