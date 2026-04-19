# Omarchy-Inspired Hyprland Rice

A standalone, bloat-free Hyprland rice — **identical look & feel to Omarchy**, no Omarchy binaries required.

**Theme:** Catppuccin Mocha across everything — terminal, bar, launcher, lock screen, notifications.

---

## File Structure

```
hyprland-rice/
├── install.sh                  ← Run this to deploy everything
│
├── hypr/
│   ├── hyprland.conf           ← Main entry point
│   ├── env.conf                ← Wayland environment variables
│   ├── monitors.conf           ← Auto-detect preferred resolution
│   ├── input.conf              ← Keyboard + touchpad
│   ├── looknfeel.conf          ← Gaps, borders, blur, animations
│   ├── autostart.conf          ← Startup daemons
│   ├── windowrules.conf        ← Opacity rules, floats
│   ├── bindings.conf           ← All keybindings
│   └── hyprpaper.conf          ← Wallpaper daemon
│
├── waybar/
│   ├── config.jsonc            ← Bar layout (identical to Omarchy)
│   └── style.css               ← Catppuccin Mocha styling
│
├── kitty/
│   └── kitty.conf              ← Catppuccin Mocha + JetBrainsMono (Omarchy-identical)
│
├── mako/
│   └── config                  ← Catppuccin Mocha notifications
│
├── wofi/
│   ├── config                  ← Launcher settings
│   └── style.css               ← Catppuccin Mocha launcher theme
│
├── hyprlock/
│   └── hyprlock.conf           ← Lock screen (blurred screenshot + clock)
│
├── hypridle/
│   └── hypridle.conf           ← Idle: dim → lock → display off → suspend
│
└── starship/
    └── starship.toml           ← Prompt (identical to Omarchy)
```

---

## Install

```bash
# 1. Install required packages
sudo pacman -S hyprland waybar kitty mako wofi hyprlock hypridle hyprpaper \
               polkit-gnome swayosd pipewire wireplumber pamixer \
               brightnessctl playerctl grim slurp wl-clipboard starship \
               noto-fonts ttf-font-awesome

# Install JetBrainsMono Nerd Font (AUR)
yay -S ttf-jetbrains-mono-nerd

# 2. Deploy configs
chmod +x install.sh
./install.sh

# 3. Set your wallpaper
# Copy any .jpg/.png to:
cp /path/to/wallpaper.jpg ~/.config/hypr/wallpaper.jpg
# Catppuccin wallpapers: https://github.com/zhichaoh/catppuccin-wallpapers

# 4. Start Hyprland from TTY
# Add to ~/.bash_profile or ~/.zprofile:
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec uwsm start hyprland-uwsm.desktop
fi
```

---

## Key Bindings Quick Reference

| Key | Action |
|---|---|
| `SUPER + RETURN` | Open terminal (kitty) |
| `SUPER + SPACE` | App launcher (wofi) |
| `SUPER + W` | Close window |
| `SUPER + arrows` | Move focus |
| `SUPER + SHIFT + arrows` | Swap windows |
| `SUPER + 1–9` | Switch workspace |
| `SUPER + SHIFT + 1–9` | Move window to workspace |
| `SUPER + TAB / SHIFT+TAB` | Next/prev workspace |
| `SUPER + F` | Fullscreen |
| `SUPER + T` | Toggle float |
| `SUPER + S` | Scratchpad |
| `SUPER + G` | Toggle window grouping |
| `SUPER + J` | Toggle split direction |
| `SUPER + SHIFT + SPACE` | Toggle Waybar |
| `SUPER + CTRL + L` | Lock screen |
| `PRINT` | Area screenshot |
| `SHIFT + PRINT` | Full screenshot |
| `SUPER + PRINT` | Color picker |
| `SUPER + ,` | Dismiss notification |
| Volume/Brightness keys | OSD via swayosd |

---

## Customisation Notes

- **Monitor**: Edit `hypr/monitors.conf` — currently auto-detects preferred resolution
- **Rounding**: `looknfeel.conf` → `rounding = 0` (Omarchy default). Set to `8` for rounded corners
- **Theme**: All Catppuccin Mocha. Colors defined at the top of each CSS/conf file
- **Terminal**: Change `$terminal = kitty` in `bindings.conf` to your preferred terminal
- **Wallpaper**: Point `hyprpaper.conf` to your wallpaper file
