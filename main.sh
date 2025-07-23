#!/bin/bash

# === main.sh ===
# GUI Launcher for HTML5 -> APK builder

set -e

TOOLSET_DIR="$(dirname "$0")/toolset"

# Ensure all scripts in toolset are executable
chmod +x "$TOOLSET_DIR"/*.sh

# -- Check zenity
if ! command -v zenity &> /dev/null; then
  echo "Zenity non è installato."
  exit 1
fi

# -- Ask whether to install requirements
if zenity --question --title="HTML5 to APK Builder" --text="Do you want to install the requirements before starting?"; then
  bash "$TOOLSET_DIR/requirements_debian.sh"
fi

# -- Select HTML5 folder
HTML5_FOLDER=$(zenity --file-selection --directory --title="Seleziona la cartella HTML5")
if [ $? -ne 0 ] || [ -z "$HTML5_FOLDER" ]; then
  zenity --info --text="Operazione annullata. Uscita."
  exit 0
fi

# -- Enter app name
APP_NAME=$(zenity --entry --title="Nome App" --text="Inserisci il nome della app:")
if [ $? -ne 0 ] || [ -z "$APP_NAME" ]; then
  zenity --info --text="Operazione annullata. Uscita."
  exit 0
fi

# -- Enter author name
APP_AUTHOR=$(zenity --entry --title="Autore / Azienda" --text="Inserisci il nome dell'autore o azienda:")
if [ $? -ne 0 ] || [ -z "$APP_AUTHOR" ]; then
  zenity --info --text="Operazione annullata. Uscita."
  exit 0
fi

# -- Select output folder
OUTPUT_FOLDER=$(zenity --file-selection --directory --title="Seleziona la cartella di destinazione APK")
if [ $? -ne 0 ] || [ -z "$OUTPUT_FOLDER" ]; then
  zenity --info --text="Operazione annullata. Uscita."
  exit 0
fi

# -- Select PNG icon
ICON_PATH=$(zenity --file-selection --file-filter="*.png" --title="Seleziona un'icona PNG (1024x1024 consigliato)")
if [ $? -ne 0 ] || [ -z "$ICON_PATH" ]; then
  zenity --info --text="Operazione annullata. Uscita."
  exit 0
fi

# -- Run the build script
bash "$TOOLSET_DIR/build_apk.sh" \
  "$HTML5_FOLDER" "$APP_NAME" "$APP_AUTHOR" "$OUTPUT_FOLDER" "$ICON_PATH"

exit 0
