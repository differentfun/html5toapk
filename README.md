# HTML5 to APK (Cordova Builder)

Easily convert an HTML5 app into an Android APK using a simple graphical interface.

✅ Requirements
- Node.js  
- Cordova  
- Java JDK  
- Gradle  
- ImageMagick  

On Debian-based systems, run the included script:

$ `./toolset/requirements_debian.sh`

📄 License

You are free to:
- Use this tool and anything you create with it in any type of project
- Share the tool freely

You are not allowed to:
- Sell this tool
- Include it in commercial or proprietary software

🚀 How to Use

$ `chmod +x main.sh`

$ `./main.sh`

!!! Extra Info !!!

The Android SDK path is defined in setup_android_env.sh:

`export ANDROID_HOME="$HOME/.Android/Sdk"`

If your SDK is located elsewhere, you’ll need to update that path accordingly.

The Cordova Android platform version used is 32.0.0, to ensure the best compatibility across a wide range of Android devices.
