# TeamGoTest
## General info
This application is aimed to manage and display list of events. All events data is stored locally on device 
using SQLite storage.

#Building & Running
##Preconditions
To build this application you must have [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
Please refer to the link above documentation to get instructions for your platform. 
You will also need [Android](http://www.androiddocs.com/sdk/installing/index.html) 
and/or [iOS](https://medium.com/@LondonAppBrewery/how-to-download-and-setup-xcode-10-for-ios-development-b63bed1865c) SDK and build tools.
All future instructions were written and tested using Android toolchain but should work with iOS as well with minor changes. 
All flutter commands must be executed from root project folder.
##Instant run debug build on connected emulator
`flutter run` 
##Build debug application
`flutter build apk`
##Build release application
`flutter build apk --release`
Your release build will be placed in `build\app\outputs\apk\release\app-release.apk`. You can install it using `adb install <full apk path>`.
*Please note:* release version can run only on hardware device, not on the emulator.
##Run tests set
`flutter test`

# Demo video:

![Demo Video](demo/demo.gif)