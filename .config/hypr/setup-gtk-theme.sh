#!/bin/bash

# Define GTK config directory paths
GTK3_DIR="$HOME/.config/gtk-3.0"
GTK4_DIR="$HOME/.config/gtk-4.0"

# Create directories if they don't exist
mkdir -p "$GTK3_DIR" "$GTK4_DIR"

# Define the settings content
read -r -d '' GTK_SETTINGS << EOM
[Settings]
gtk-theme-name = catppuccin-mocha-lavender-standard+default:dark
gtk-icon-theme-name = candy-icons
gtk-font-name = DejaVu Sans 11
EOM

# Write the settings to gtk-3.0/settings.ini
echo "$GTK_SETTINGS" > "$GTK3_DIR/settings.ini"

# Write the settings to gtk-4.0/settings.ini
echo "$GTK_SETTINGS" > "$GTK4_DIR/settings.ini"

echo "GTK 3 and GTK 4 config files created with your theme settings!"
