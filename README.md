# RNPulseButton

[![Platform](https://img.shields.io/cocoapods/p/RNPulseButton.svg?style=flat)](http://cocoapods.org/pods/RNPulseButton)
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/RNPulseButton.svg?style=flat)](http://cocoapods.org/pods/RNPulseButton)
[![License](https://img.shields.io/cocoapods/l/RNPulseButton.svg?style=flat)](http://cocoapods.org/pods/RNPulseButton)

Easy and Customizable iOS Pulse Animation Effect

## Demo

![Example gif](https://media.giphy.com/media/xUNd9Meox7k0MaSQSI/giphy.gif)

## Installation

RNPulseButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RNPulseButton'
```

## At a Glance

### Create Cusom Pulse

#### StoryBoard : Just make it! Adjust property from storyboard inspector

#### Programmatically
``` swift
let pulse2 = RNPulseButton(frame: CGRect(x: 150, y: 300, width: 100, height: 100),
                           pulseRadius: 100,
                           pulseCount: 4,
                           pulseDuration: 3,
                           intervalTime: 0.4,
                           scaleFactor: 3,
                           repeatCount: 100,
                           pulseColor: UIColor.red,
                           normalImage: nil, selectedImage: nil)
```

#### Animation Start

```swift
pulse2.start()
```

#### Animation Stop

```swift
pulse2.stop()
```

#### Customizable Property
```swift
    pulseRadius: Double     // Pulse Radius
    pulseCount: Int         // Number of Pulse
    pulseDuration: Double   // Pulse Animation Duration
    intervalTime: Double    // Interval between Pulse
    scaleFactor: CGFloat    // Pulse Radius Scale Factor
    repeatCount: Int        // Animation Repeat Count
    pulseColor: UIColor     // Set Pulse Color
    normalImage: UIImage?   // (Optional) Set Normal State Image
    selectedImage: UIImage? // (Optional) Set Selected State Image
```

## Author

Rodo, planon21@gmail.com

## License

RNPulseButton is available under the MIT license. See the LICENSE file for more info.
