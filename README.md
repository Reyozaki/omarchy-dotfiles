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
These parent directories are package names that contain the configuration setups as they would be in a Omarchy system.

## Package setup
```
alacritty
└── .config
    └── alacritty
        └── alacritty.toml
```
Each Package is setup with reference to the root directory, allowing individual installation. When you run `stow alacritty` it will go to the local .config directory `~/.config/alacritty`. Similarly, `bash/.bashrc` is symbolically linked to `~/.bashrc`.

# Installation
Clone the repository in a local directory.
```
git clone git@github:Reyozaki/omarchy-dotfiles.git
```
With stow installed in your system run `stow package_name` to apply the configuration for that specific package in your local system. Conflict will occur if there are local files present where the symlinks are going to be, to prevent conflict you can either delete or move the existing local config files/directory. For example:
```
# delete existing directory
rm -r ~/.config/alacritty

# move existing directory
mv ~/.config/alacritty ~/.config/alacritty_default

# apply stow to create symlink of alacritty
stow alacritty
```

Multiple packages can be installed by seperating them with space.
```
# applying changes for multiple packages 
stow alacritty nvim hypr omarchy
```

## Simpler setup for all configs
If packages are not your thing you can skip using package directories and use the directory path from root/Home.
```
├── .config/alacritty
├── .bashrc
├── .config/btop
├── .config/fastfetch
├── .config/hypr
├── .config/nvim
├── .config/omarchy
├── .config/swayosd
├── .config/walker
└── .config/waybar
```
With this setup you can run `stow .` to create symlinks of all the files and folders listed in the current directory.

## Use your dotfiles
if you want to use this directory setup and store your own configurations, use this command
```
# pull the (package_name) configs into the current (package_name) directory
stow --adopt package_name
# or . for all
```

