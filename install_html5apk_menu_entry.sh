#!/bin/bash

# === install_html5apk_menu_entry.sh ===
# Global menu entry installer for "HTML5 to APK Utility"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LAUNCHER="$ROOT_DIR/main.sh"
DESKTOP_FILE="/usr/share/applications/html5apk-utility.desktop"
ICON_PATH="$ROOT_DIR/toolset/icon.png"  # Update if your icon is elsewhere

# Check if launcher script exists
if [[ ! -f "$LAUNCHER" ]]; then
  echo "❌ Launcher script not found: $LAUNCHER"
  exit 1
fi

# Check if icon exists, fallback to default system icon if not
if [[ ! -f "$ICON_PATH" ]]; then
  ICON_PATH="applications-development"
fi

# Create global .desktop file
sudo bash -c "cat > '$DESKTOP_FILE'" <<EOF
[Desktop Entry]
Name=HTML5 to APK Utility
Comment=Convert your HTML5 project into an Android APK
Exec=$LAUNCHER
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Development;Utility;
EOF

# Set proper permissions
sudo chmod 644 "$DESKTOP_FILE"

echo "✅ Menu entry created at: $DESKTOP_FILE"
