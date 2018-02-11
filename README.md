![](./Images/StellaShield.jpg)

[![CI Status](http://img.shields.io/travis/icapps/ios-stella.svg?style=flat)](https://travis-ci.org/icapps/ios-stella)
[![License](https://img.shields.io/cocoapods/l/Stella.svg?style=flat)](http://cocoapods.org/pods/Stella)
[![Platform](https://img.shields.io/cocoapods/p/Stella.svg?style=flat)](http://cocoapods.org/pods/Stella)
[![Version](https://img.shields.io/cocoapods/v/Stella.svg?style=flat)](http://cocoapods.org/pods/Stella)
[![Language Swift 4.0](https://img.shields.io/badge/Language-Swift%204.0-orange.svg?style=flat)](https://swift.org)

> Stella contains a set of utilities that can be used during iOS development in Swift.

## TOC

- [Installation](#installation)
- [Features](#features)
  - [Defaults](#defaults)
  - [Keychain](#keychain)
  - [Localization](#localization)
  - [Printing](#printing)
  - [Number formatting](#numberformatting)
  - [String Size Calulations](#stringSizeCalulations)
- [Bucket List](#bucket-list)
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

### Printing

Add something extra to your debug output. There are *three* extra functions available for you to use.

```swift
printAction("This is a user action.")
// The debug console will print `🎯 This is a user action.`

printBreadcrumb("This is your breadcrumb.")
// The debug console will print `🍞 This is your breadcrumb.`

printError("This is an error.")
// The debug console will print `🔥 This is an error.`

printQuestion("This is a question")
// The debug console will print `❓ This is an question.`
```
#### Throws to print

You can pass functions as paramters. We use this to give an arbitrary function to a print function. This function can throw inside the function but not outside. If the function you provide throws an error a print happens like in the example above.
Important is that you change the `()` to `{}` to indicate that you are passing a function. *(Also called thrailing closure)*.

```swift
// Example error

enum PrintError: Error {
  case serious(message: String)
}
```
```swift
printThrowAsError { throw PrintError.serious(message: "Something went horribly wrong!")}
// The debug console will print `🔥 PrintError.serious(message: Something went horribly wrong!).`
```
Rest of the prints works like the 'normal' prints that use `()`.

#### Print Levels

You can simply specify print levels like:

```swift
Output.level = .verbose
```

or to only print errors
```swift
Output.level = .error
```

Or just shut up everything, handy for in unit tests.

```swift
Output.level = .nothing
```
To see what is printed for what level look at the `PrintSpec`.

## Number formatting

Also see `StellaNumberFormattingSpec`...

```swift
// round to number of decimals
StellaNumberFormatter.maximumFractionDigits = 4

let double: Double = 22.56989123

print(double.roundedString)
// The debug console prints "rouned to 4 digits: 22.5699"
```

```swift
// round without decimal separator

let double: Double = 22.56989123

print(double.roundedStringNoDecimals)
// The debug console prints "23"
```

## String Size Calulations

Usefull when you want a `UILabel` to have a specific height to contain all the text.

```swift
let string = "Donec ullamcorper nulla non metus auctor fringilla. Donec id elit non mi porta gravida at eget metus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor."
let font = UIFont.systemFont(ofSize: 17)
let constraintWidth:CGFloat = 200

print(string.height(constraintTo: width, font: font))
// The debug console will print 304,89...

```

This also works for attributed strings, see `StringSizeCalculationSpec`.

## Bucket List

Here is an overview what is on our todo list.

- [ ] The `sharedInstance` should be more configurable with a closure.
- [ ] Add keychain integration.

## Author

Jelle Vandebeeck, jelle@fousa.be

## License

Stella is available under the MIT license. See the LICENSE file for more info.
