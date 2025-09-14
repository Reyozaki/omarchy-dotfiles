# omarchy-dotfiles
Desktop environment configurations with Hyprland with on top of Arch Linux, setup is called Omarchy created by DHH.
Omarchy website: omarchy.org

# Included Packages
Isolated with symlinks using GNU Stow.

```
├── alacritty
├── bash
├── btop
├── fastfetch
├── hypr
├── nvim
├── omarchy
├── swayosd
├── walker
└── waybar
```

## Package setup
```
alacritty
└── .config
    └── alacritty
        └── alacritty.toml
```
Each Package is setup with reference to the root directory. When you run `stow alacritty` it will go to the config directory `~/.config/alacritty`.

