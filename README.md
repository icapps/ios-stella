![](./Images/StellaShield.jpg)

[![CI Status](http://img.shields.io/travis/icapps/ios-stella.svg?style=flat)](https://travis-ci.org/icapps/ios-stella)
[![License](https://img.shields.io/cocoapods/l/Stella.svg?style=flat)](http://cocoapods.org/pods/Stella)
[![Platform](https://img.shields.io/cocoapods/p/Stella.svg?style=flat)](http://cocoapods.org/pods/Stella)
[![Language Swift 4.0](https://img.shields.io/badge/Language-Swift%204.0-orange.svg?style=flat)](https://swift.org)

> Stella contains a set of utilities that can be used during iOS development in Swift.

## TOC

- [Installation](#installation)
- [Features](#features)
  - [Defaults](#defaults)
  - [Keychain](#keychain)
  - [Localization](#localization)
- [Author](#author)
- [License](#license)

## Installation

Stella is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your `Podfile`:

```ruby
pod 'Stella', git: 'https://github.com/icapps/ios-stella.git', commit: '...'
```

_Pass the correct commit reference to make sure your code doesn't break in future updates._

## Features

### Defaults

We have a cleaner way to use `NSUserDefaults`. Define the user defaults by extending the `DefaultsKeys` class.

```swift
extension DefaultsKeys {
  // Writes a string object to the defaults with the 'stringValue' key.
  static let stringValue = DefaultsKey<String?>("stringValue")
  // Writes an integer to the defaults with the 'integerValue' key.
  static let integerValue = DefaultsKey<Int?>("integerValue")
  // Writes a double to the defaults with the 'doubleValue' key.
  static let doubleValue = DefaultsKey<Double?>("doubleValue")
  // Writes a float to the defaults with the 'floatValue' key.
  static let floatValue = DefaultsKey<Float?>("floatValue")
  // Writes a bool to the defaults with the 'booleanValue' key.
  static let booleanValue = DefaultsKey<Bool?>("booleanValue")
  // Writes a date object to the defaults with the 'dateValue' key.
  static let dateValue = DefaultsKey<NSDate?>("dateValue")
}
```

You can read/write the from/to the `NSUserDefaults` by using the `subscript` on the `Defaults` class.

```swift
Defaults[.stringValue] = "A string value"
print(Defaults[.stringValue]) // Prints 'A string value'

Defaults[.integerValue] = 123
print(Defaults[.integerValue]) // Prints '123'

Defaults[.doubleValue] = 123.123
print(Defaults[.doubleValue]) // Prints '123.123'

Defaults[.floatValue] = 123.321
print(Defaults[.floatValue]) // Prints '123.312'

Defaults[.booleanValue] = true
print(Defaults[.booleanValue]) // Prints 'true'

Defaults[.dateValue] = NSDate()
print(Defaults[.dateValue]) // Prints '1996-12-19T16:39:57-08:00'
```

### Keychain

We have a cleaner way to use the `Keychain`. Define the user defaults by extending the `Keys` class.

```swift
extension Keys {
  // Writes a string object to the keychain with the 'stringValue' key.
  static let stringValue = Key<String?>("stringValue")
}
```

You can read/write the from/to the `Keychain` by using the `subscript` on the `Keychain` class.

```swift
Keychain[.stringValue] = "A string value"
print(Keychain[.stringValue]) // Prints 'A string value'
```

### Localization

Localize a key in no time with this handy localization function.

```swift
let key = "this_is_your_localization_key"
print(key.localizedString)
// The debug console will print the localized
// string found in your .strings file.
```

## Author

Jelle Vandebeeck, jelle.vandebeeck@icapps.com

## License

Stella is available under the MIT license. See the LICENSE file for more info.
