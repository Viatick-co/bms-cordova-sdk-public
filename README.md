# bms-cordova-sdk-public

## Installation

Run following command in your `ionic / cordova` project root directory.

```
$ ionic cordova plugin add https://github.com/Viatick-co/bms-cordova-sdk-public.git
```

## Settings

### iOS xcode

* Build Settings

- SWIFT_VERSION => ^3.3

* Build Phases

- UserNotifications.framework
- CoreLocation.framework
- NotificationCenter.framework

* Info.plist

```xml
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>description for location access</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>description for location access</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>description for location access</string>
```


## Sample Codes

```javascript

```