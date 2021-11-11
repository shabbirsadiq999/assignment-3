<p align="center">
 <img src="https://github.com/iamtheblackunicorn/Ignotus/raw/main/assets/images/banner.png"/>
</p>

# IGNOTUS :shushing_face:

*a simple guessing game written in Dart for Android and Mac OSX* :shushing_face:

## ABOUT :books:

Because I wanted to write a small and fun game in Flutter and Dart to play on my Mac and on my Android phone, I thought I'd implement the classic number-guessing game that every developer has written at one point or another. Ignotus is that game. Enjoy! :)

## DOWNLOAD :inbox_tray:

- Initial release (1.0.0): 
  - [Download for Android](https://github.com/iamtheblackunicorn/Ignotus/releases/download/v.1.0.0/Ignotus-v.1.0.0.apk) (16.3 MB)
  - [Download for Mac OSX](https://github.com/iamtheblackunicorn/Ignotus/releases/download/v.1.0.0/Ignotus-v.1.0.0.app.zip) (11.8 MB)

## BUILDING :hammer:

### Preparation

Please install the following tools:

- Android Studio
- Xcode (for a Mac OSX build)
- Java JDK
- Make
- Git
- Flutter

After having done this, run `flutter doctor` to see that everything is available for making a build.
Next, clone this repository! You could open up a terminal and run `make build_android`, however, you need to tell Flutter which certificates to use to sign the app.
To tell Flutter which certificates to use, we need to generate some first!

To do this, run this command on Mac OSX and Linux:

```bash
$ keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```
or if you are on Windows, run this instead:

```bash
keytool -genkey -v -keystore key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key
```
If that was successful, fill out the fields for the keystore password in `android/app/key.properties` with the password you just used and place the file `key.jks`
into `android/app/`. Now, you can safely build a release APK!

### Final steps for Android

- Run `flutter pub get`.
- Run `make build_android`.

### Final steps for Mac OSX

- Run `make build_macosx`.

## Note :scroll:

- *Ignotus :shushing_face:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
