#!/usr/bin/env bash

set -euo pipefail

PKGDIR="$HOME/dotfiles/packages"
mkdir -p "$PKGDIR"
PKGFILE="${1:-$PKGDIR/pkglist.txt}"
AUR_PKGFILE="${2:-$PKGDIR/pkglist-aur.txt}"

# Regex of packages to exclude (driver / hardware-specific)
EXCLUDE_DRIVERS='^(intel-ucode|amd-ucode|xf86-video-.*|nvidia.*|nouveau.*|mesa|mesa-.*|(lib32-)?vulkan-(intel|radeon|nouveau)|libva-intel-driver|libva-mesa-driver|intel-media-driver|xf86-input-.*|broadcom-wl.*|bcm.*|linux-firmware.*)$'

echo "Saving official repo packages to $PKGFILE..."
pacman -Qqen | grep -Ev "$EXCLUDE_DRIVERS" >"$PKGFILE"

echo "Saving AUR/foreign packages to $AUR_PKGFILE..."
pacman -Qqem | grep -Ev "$EXCLUDE_DRIVERS" >"$AUR_PKGFILE"

echo "Done."
echo "  Official: $(wc -l <"$PKGFILE") packages"
echo "  AUR:      $(wc -l <"$AUR_PKGFILE") packages"
