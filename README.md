# mydotfiles

dotfiles for my fedora rice

## Run the following commands to setup

```bash
sudo dnf copr enable lionheartp/Hyprland 
sudo dnf copr enable lukenukem/asus-linux 
sudo dnf install fastfetch hyprland hypridle hyprlock xdg-desktop-portal-hyprland awww asusctl asusctl-rog-gui kitty grimshot rust cargo cliphist rofi zsh ImageMagick
cargo install wallust
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git>${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "\${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
stow .
mkdir ~/Pictures/backgrounds
mkdir ~/Pictures/screenshots
```

Note: for background selector and random wallpaper change to work please put wallpapers in ~/Pictures/backgrounds folder

### Optional downloads

```bash
sudo dnf install flatpak vscode bottles
flatpak install flathub com.github.tchx84.Flatseal com.spotify.Client com.valvesoftware.Steam dev.vencord.Vesktop md.obsidian.Obsidian
```
