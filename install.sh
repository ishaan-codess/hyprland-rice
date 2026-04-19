#!/usr/bin/env bash
# ============================================================
# install.sh — Omarchy-inspired Hyprland Rice installer
# Run this from inside the hyprland-rice/ directory:
#   chmod +x install.sh && ./install.sh
# ============================================================

set -e

RICE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

echo "🚀 Installing Omarchy-inspired Hyprland rice..."
echo "   Source: $RICE_DIR"
echo "   Target: $CONFIG"
echo ""

# --- Create target directories ---
mkdir -p \
  "$CONFIG/hypr" \
  "$CONFIG/waybar" \
  "$CONFIG/kitty" \
  "$CONFIG/mako" \
  "$CONFIG/wofi" \
  "$CONFIG/hyprlock" \
  "$CONFIG/hypridle" \
  "$HOME/.config/starship" \
  "$HOME/Pictures/Screenshots"

# --- Hyprland ---
echo "→ Installing Hyprland configs..."
cp "$RICE_DIR/hypr/hyprland.conf"  "$CONFIG/hypr/"
cp "$RICE_DIR/hypr/env.conf"       "$CONFIG/hypr/"
cp "$RICE_DIR/hypr/monitors.conf"  "$CONFIG/hypr/"
cp "$RICE_DIR/hypr/input.conf"     "$CONFIG/hypr/"
cp "$RICE_DIR/hypr/looknfeel.conf" "$CONFIG/hypr/"
cp "$RICE_DIR/hypr/autostart.conf" "$CONFIG/hypr/"
cp "$RICE_DIR/hypr/windowrules.conf" "$CONFIG/hypr/"
cp "$RICE_DIR/hypr/bindings.conf"  "$CONFIG/hypr/"
cp "$RICE_DIR/hypr/hyprpaper.conf" "$CONFIG/hypr/"

# --- Waybar ---
echo "→ Installing Waybar..."
cp "$RICE_DIR/waybar/config.jsonc" "$CONFIG/waybar/"
cp "$RICE_DIR/waybar/style.css"    "$CONFIG/waybar/"

# --- Kitty ---
echo "→ Installing Kitty terminal..."
cp "$RICE_DIR/kitty/kitty.conf" "$CONFIG/kitty/"

# --- Mako notifications ---
echo "→ Installing Mako notifications..."
cp "$RICE_DIR/mako/config" "$CONFIG/mako/"

# --- Wofi launcher ---
echo "→ Installing Wofi launcher..."
cp "$RICE_DIR/wofi/style.css" "$CONFIG/wofi/"
cp "$RICE_DIR/wofi/config"    "$CONFIG/wofi/"

# --- Hyprlock ---
echo "→ Installing Hyprlock..."
cp "$RICE_DIR/hyprlock/hyprlock.conf" "$CONFIG/hyprlock/"

# --- Hypridle ---
echo "→ Installing Hypridle..."
cp "$RICE_DIR/hypridle/hypridle.conf" "$CONFIG/hypridle/"

# --- Starship prompt ---
echo "→ Installing Starship prompt..."
cp "$RICE_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

# --- Fish shell starship integration ---
if command -v fish &>/dev/null; then
  FISH_CONFIG="$HOME/.config/fish/config.fish"
  mkdir -p "$(dirname "$FISH_CONFIG")"
  if ! grep -q "starship init fish" "$FISH_CONFIG" 2>/dev/null; then
    echo "" >> "$FISH_CONFIG"
    echo "# Starship prompt" >> "$FISH_CONFIG"
    echo "starship init fish | source" >> "$FISH_CONFIG"
    echo "→ Added Starship to fish config"
  fi
fi

echo ""
echo "✅ Done! Rice installed."
echo ""
echo "📦 Packages you need (install with pacman/yay):"
echo "   pacman -S hyprland waybar kitty mako wofi hyprlock hypridle hyprpaper"
echo "   pacman -S polkit-gnome swayosd pipewire wireplumber pamixer brightnessctl playerctl"
echo "   pacman -S grim slurp wl-clipboard starship noto-fonts"
echo "   yay -S nerd-fonts-jetbrains-mono  (or: ttf-jetbrains-mono-nerd from AUR)"
echo ""
echo "🖼️  Set your wallpaper:"
echo "   Copy a .jpg/.png to ~/.config/hypr/wallpaper.jpg"
echo "   Catppuccin wallpapers: https://github.com/zhichaoh/catppuccin-wallpapers"
echo ""
echo "🚦 Start Hyprland:"
echo "   # If using uwsm (recommended):"
echo "   uwsm start hyprland-uwsm.desktop"
echo "   # Or add to ~/.bash_profile / ~/.zprofile:"
echo "   if [ -z \"\$DISPLAY\" ] && [ \"\$XDG_VTNR\" = 1 ]; then"
echo "     exec uwsm start hyprland-uwsm.desktop"
echo "   fi"
