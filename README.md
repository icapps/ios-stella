Stella [![CI Status](http://img.shields.io/travis/icapps/ios-stella.svg?style=flat)](https://travis-ci.org/icapps/ios-stella) [![Version](https://img.shields.io/cocoapods/v/Stella.svg?style=flat)](http://cocoapods.org/pods/Stella) [![License](https://img.shields.io/cocoapods/l/Stella.svg?style=flat)](http://cocoapods.org/pods/Stella) [![Platform](https://img.shields.io/cocoapods/p/Stella.svg?style=flat)](http://cocoapods.org/pods/Stella)
======

Stella contains a set of utilities that can be used during iOS development in Swift.

## Installation

Stella is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your `Podfile`:

```ruby
pod 'Stella', '~> 0.1'
```

## Utilities

### Localization

Localize a key on no time with this handy localization function.

```swift
let key = "this_is_your_localization_key"
print(key.localizedString)
// The debug console will print the localized
// string found in your .strings file.
```

### Printing

Add something extra to your debug output. There are *three* extra functions available for you to use.

```swift
printAction("This is a user action.")
// The debug console will print `🎯 This is a user action.`

printBreadcrumb("This is your breadcrumb.")
// The debug console will print `🍞 This is your breadcrumb.`

printError("This is an error.")
// The debug console will print `🔥 This is an error.`
```

### Threading

Perform block on the main or on the background queue more easily.

```swift
dispatch_on_main {
  // Perform this code on the main thread.
}

dispatch_on_main_after(2) {
  // Perform this code on the main thread after 2 seconds.
}

dispatch_in_background {
  // Perform this code on a background thread.
}
```

## Author

Jelle Vandebeeck, jelle@fousa.be

## License

Stella is available under the MIT license. See the LICENSE file for more info.
