# ExtendedUIKit
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
![Platform](https://img.shields.io/badge/platforms-iOS%209.0+%20%7C%20watchOS%202.0+-333333.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

Protocols and extensions for the UIKit framework.

Includes both the [ExtendedFoundation](https://github.com/daniel-barros/ExtendedFoundation) and [ExtendedCoreGraphics](https://github.com/daniel-barros/ExtendedCoreGraphics) frameworks (via dependencies if using CocoaPods, otherwise you have to include them yourself).

## Installation

### CocoaPods

Install [CocoaPods](http://cocoapods.org) with the following command:

```bash
$ gem install cocoapods
```

Go to your project directory and create a `Podfile` with:

```bash
$ pod init
```

Add these lines to your `Podfile`:

```ruby
use_frameworks!

target '<Your Target Name>' do
    pod 'ExtendedUIKit'
end
```

Finally, run the following command:

```bash
$ pod install
```

### Manually

Drag the whole project into your workspace, build it, and add the framework to the Embedded Binaries of your project.
