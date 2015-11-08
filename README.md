# HasAssociatedObjects
==================

[![Swift Version](https://img.shields.io/badge/Swift-2.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/cocoapods/l/HasAssociatedObjects.svg?style=flat)](https://github.com/tokorom/HasAssociatedObjects/blob/master/LICENSE)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/HasAssociatedObjects.svg?style=flat)](https://cocoapods.org/)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

We can add some stored objects to Swift extension

## Q. Can we add a stored property to extension?

A. No, but we can use assciated objects instead.

## Simple Usage

```swift
extension UIViewController: HasAssociatedObjects {

    // new stored property
    var storedString: String? {
        get {
            return self.associatedObjects.value as? String
        }
        set {
            self.associatedObjects.value = newValue
        }
    }

}
```

## Other Usages

### Multiple stored properties

```swift
extension UIViewController: HasAssociatedObjects {

    var storedString: String? {
        get {
            return self.associatedObjects["STRING"] as? String
        }
        set {
            self.associatedObjects["STRING"] = newValue ?? ""
        }
    }

    var storedInt: Int {
        get {
            guard let value = self.associatedObjects["INT"] as? Int else {
                return 0 //< default value
            }
            return value
        }
        set {
            self.associatedObjects["INT"] = newValue
        }
    }

}
```

### Use directly

```swift
extension Subject: HasAssociatedObjects {
}

subject.associatedObjects.value = 10

let storedValue = subject.associatedObjects.value as? Int
XCTAssertEqual(10, storedValue)
```

### Subject is not AnyObject

```swift
// subject is struct
struct AnySubject {
    let identifier: Int
}

// a appropriate property that can be cleaned
var propertyOfSomeone: [Int: AssociatedObjects] = [:]

// You can customize `associatedObjects`
extension AnySubject: HasAssociatedObjects {
    var associatedObjects: AssociatedObjects {
        guard let associatedObjects = propertyOfSomeone[self.hashValue] else {
            let associatedObjects = AssociatedObjects()
            propertyOfSomeone[hashValue] = associatedObjects
            return associatedObjects
        }
        return associatedObjects
    }
}

extension AnySubject: Hashable {
    var hashValue: Int {
        return self.identifier
    }
}

func ==(lhs: AnySubject, rhs: AnySubject) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
```

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate HasAssociatedObjects into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'HasAssociatedObjects'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate HasAssociatedObjects into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "tokorom/HasAssociatedObjects"
```

Then, run the following command:

```bash
$ carthage update
```

Then, link your app with `HasAssociatedObjects.framework`.
