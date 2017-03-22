# SwiftyInvocation

[![CI Status](http://img.shields.io/travis/piotr-tobolski/SwiftyInvocation.svg?style=flat)](https://travis-ci.org/piotr-tobolski/SwiftyInvocation)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/SwiftyInvocation.svg)](https://cocoapods.org/pods/SwiftyInvocation)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Twitter](https://img.shields.io/badge/twitter-@piotrtobolski-blue.svg?style=flat)](http://twitter.com/piotrtobolski)
[![Version](https://img.shields.io/cocoapods/v/SwiftyInvocation.svg?style=flat)](https://cocoapods.org/pods/SwiftyInvocation)
[![License](https://img.shields.io/cocoapods/l/SwiftyInvocation.svg?style=flat)](https://cocoapods.org/pods/SwiftyInvocation)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyInvocation.svg?style=flat)](https://cocoapods.org/pods/SwiftyInvocation)

Have you ever dreamed about using NSInvocation from Swift code?
You hate Apple for the NS_SWIFT_UNAVAILABLE macro?

Me neither.

But sometimes we just HAVE to use it. And here it is.

## Example

Check the unit tests.

```swift
let array: NSArray = ["1", "2", "3"]

let selector = #selector(NSArray.object(at:))
let methodSignature = NSArray.si_instanceMethodSignature(for: selector)
let invocation = SIInvocation(methodSignature: methodSignature)
invocation.target = array
invocation.selector = selector
var argument = 1
invocation.setArgument(&argument, at: 2)
invocation.retainArguments()

invocation.invoke()

var returnValue: Unmanaged<NSString>?
invocation.getReturnValue(&returnValue)

XCTAssertEqual(returnValue?.takeUnretainedValue(), "2")
```

## Requirements

Swift 3, Objective-C runtime

## Installation

SwiftyInvocation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftyInvocation"
```

It is also available through [Carthage](https://github.com/Carthage/Carthage):
```ruby
github "piotr-tobolski/SwiftyInvocation" ~> 0.1.0
```

## Author

Piotr Tobolski, piotr.tobolski@me.com

## License

SwiftyInvocation is available under the MIT license. See the LICENSE file for more info.
