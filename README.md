# Blurred background app

It used to require an entitlement for an iOS app to have a transparent background, showing through to the user's wallpaper. It looks like that's not the case anymore as of iOS 13. By setting the key `UIApplicationIsOpaque` to `NO` in your `Info.plist`, it's possible to have an app with a transparent background.

By using a visual effect view, it's possible to have an app with a blurred, vibrant background based on the user's wallpaper. That technique is demonstrated in this app.

**Disclaimer: It's [confirmed](https://twitter.com/develobile/status/1139699571498426368) that this is a bug, so Apple will probably reject your app.**

[Huge thanks to Tim Oliver for pointing this out](https://twitter.com/TimOliverAU/status/1139157909986611200).

![screenshot](./screenshot.png)
