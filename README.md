# TeamGoTest

## General info
This application is aimed to manage and display list of events. All events data is stored locally on device 
using SQLite storage.

# Building & Running
## Preconditions
To build this application you must have [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
Please refer to the link above documentation to get instructions for your platform. 
You will also need [Android](http://www.androiddocs.com/sdk/installing/index.html) 
and/or [iOS](https://medium.com/@LondonAppBrewery/how-to-download-and-setup-xcode-10-for-ios-development-b63bed1865c) SDK and build tools.
All future instructions were written and tested using Android toolchain but should work with iOS as well with minor changes. 
Check the next section for build command reference showing how to build for iOS.
All flutter commands must be executed from root project folder.

## General _flutter build_ documentation
Can be found by running `flutter build -h`
```flutter build params
flutter build -h
Flutter build commands.

Usage: flutter build <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  aot         Build an ahead-of-time compiled snapshot of your app's Dart code.
  apk         Build an Android APK file from your app.
  appbundle   Build an Android App Bundle file from your app.
  bundle      Build the Flutter assets directory from your app.
  ios         Build an iOS application bundle (Mac OS X host only).

Run "flutter help" to see global options.

```
## Instant run debug build on connected emulator
`flutter run` 

## Build debug application
`flutter build apk`

## Build release application
`flutter build apk --release`
Your release build will be placed in `build\app\outputs\apk\release\app-release.apk`. You can install it using `adb install <full apk path>`.
*Please note:* release version can run only on hardware device, not on the emulator.

## Run tests set
`flutter test`

# Demo video:

![Demo Video](demo/demo.gif)