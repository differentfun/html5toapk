# setup_android_env.sh
#!/bin/bash

export ANDROID_HOME="$HOME/.Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export JAVA_HOME="/usr/lib/jvm/default-java"

export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$PATH"
