# write_icons.sh
#!/bin/bash

TMP_DIR="$1"
ICON_SRC="$2"

BASE_PATH="$TMP_DIR/platforms/android/app/src/main/res"

# Check if convert is available
if ! command -v convert &> /dev/null; then
  zenity --error --text="ImageMagick non è installato (convert)."
  exit 1
fi

# Associations: icon path -> size
sizes=(
  "mipmap-ldpi/ic_launcher.png:36"
  "mipmap-mdpi/ic_launcher.png:48"
  "mipmap-hdpi/ic_launcher.png:72"
  "mipmap-xhdpi/ic_launcher.png:96"
  "mipmap-xxhdpi/ic_launcher.png:144"
  "mipmap-xxxhdpi/ic_launcher.png:192"
  "mipmap-ldpi-v26/ic_launcher_foreground.png:36"
  "mipmap-mdpi-v26/ic_launcher_foreground.png:48"
  "mipmap-hdpi-v26/ic_launcher_foreground.png:72"
  "mipmap-xhdpi-v26/ic_launcher_foreground.png:96"
  "mipmap-xxhdpi-v26/ic_launcher_foreground.png:144"
  "mipmap-xxxhdpi-v26/ic_launcher_foreground.png:192"
)

# Generate each icon
for entry in "${sizes[@]}"; do
  path="${entry%%:*}"
  size="${entry##*:}"
  full_path="$BASE_PATH/$path"
  mkdir -p "$(dirname "$full_path")"
  convert "$ICON_SRC" -resize ${size}x${size} "$full_path"
done

zenity --info --text="Icone generate."
