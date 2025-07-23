# build_apk.sh
#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

HTML5_DIR="$1"
APP_NAME="$2"
APP_AUTHOR="$3"
OUTPUT_DIR="$4"
ICON_PATH="$5"

TMP_DIR="/tmp/html5toapk_$$"
mkdir -p "$TMP_DIR"

# Step 1: Check environment
bash "$SCRIPT_DIR/check_env.sh" || exit 1

# Step 2: Create Cordova project
APP_ID="com.$(echo "$APP_AUTHOR" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]').$(echo "$APP_NAME" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')"

cordova create "$TMP_DIR" "$APP_ID" "$APP_NAME" || exit 1

# Step 3: Copy HTML
cp -a "$HTML5_DIR/." "$TMP_DIR/www/" || exit 1

# Step 4: Generate config.xml
bash "$SCRIPT_DIR/generate_config.sh" "$TMP_DIR" "$APP_NAME" "$APP_AUTHOR"

# Step 5: Add Platform
cd "$TMP_DIR" || exit 1
cordova platform add android@11.0.0 || exit 1

# Step 6: Icons
bash "$SCRIPT_DIR/write_icons.sh" "$TMP_DIR" "$ICON_PATH"

# Step 6.5: Setup Android env
source "$SCRIPT_DIR/setup_android_env.sh"

# Step 7: Build APK
cordova build android || exit 1

# Step 8: Copy APK
APK_SRC="$TMP_DIR/platforms/android/app/build/outputs/apk/debug/app-debug.apk"
APK_DEST="$OUTPUT_DIR/$APP_NAME.apk"
cp "$APK_SRC" "$APK_DEST" && zenity --info --text="APK generato:\n$APK_DEST"

# Step 9: Cleaning
bash "$SCRIPT_DIR/cleanup.sh" "$TMP_DIR"
