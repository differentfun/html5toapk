# generate_config.sh
#!/bin/bash

TMP_DIR="$1"
APP_NAME="$2"
APP_AUTHOR="$3"

CONFIG_PATH="$TMP_DIR/config.xml"

APP_ID="com.$(echo "$APP_AUTHOR" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]').$(echo "$APP_NAME" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')"

cat > "$CONFIG_PATH" <<EOF
<widget id="$APP_ID" version="1.0.0"
  xmlns="http://www.w3.org/ns/widgets"
  xmlns:cdv="http://cordova.apache.org/ns/1.0">
  <name>$APP_NAME</name>
  <author email="none@none.com" href="http://none.com">None</author>
  <content src="index.html" />

  <allow-intent href="http://*/*" />
  <allow-intent href="https://*/*" />
  <allow-navigation href="*" />

  <edit-config file="app/src/main/AndroidManifest.xml" mode="merge" target="/manifest/application">
    <application xmlns:android="http://schemas.android.com/apk/res/android" android:usesCleartextTraffic="true" />
  </edit-config>

  <access origin="*" />

  <preference name="AndroidInsecureFileModeEnabled" value="true" />
  <preference name="loadUrlTimeoutValue" value="600000" />
  <preference name="Fullscreen" value="true" />
  <preference name="android-windowFullscreen" value="true" />
</widget>
EOF
