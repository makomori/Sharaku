# 【update swift 4.2 and Fix iPhoneX safe aera】

![sharaku_header](https://github.com/makomori/Sharaku/blob/master/sharaku_header.png)

# Sharaku 

[![Version](https://img.shields.io/cocoapods/v/Sharaku.svg?style=flat)](http://cocoapods.org/pods/Sharaku)
[![License](https://img.shields.io/cocoapods/l/Sharaku.svg?style=flat)](http://cocoapods.org/pods/Sharaku)
[![Platform](https://img.shields.io/cocoapods/p/Sharaku.svg?style=flat)](http://cocoapods.org/pods/Sharaku)

## Usage
### How to present SHViewController
``` Swift
let imageToBeFiltered = UIImage(named: "targetImage")
let vc = SHViewController(image: imageToBeFiltered)
vc.delegate = self
self.present(vc, animated:true, completion: nil)
```

### SHViewControllerDelegate methods
``` Swift
extension ViewController: SHViewControllerDelegate {
    func shViewControllerImageDidFilter(image: UIImage) {
      // Filtered image will be returned here.
    }

    func shViewControllerDidCancel() {
      // This will be called when you cancel filtering the image.
    }
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Demo video
![Sharaku animation](https://github.com/makomori/Sharaku/blob/master/sharaku_animation.gif)

## Requirements
- Swift3
- iOS 8.3+

## Installation

Sharaku is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Sharaku"
```
### Install manually
It requires a few things. Please follow the [steps](https://github.com/makomori/Sharaku/wiki/manual_install).

## Contribution
Creating new issues for bug report, feature request and pull request is always welcome! Please feel free to contribute to Sharaku!

## Author

makomori, makomori26@gmail.com, Twitter: [@makomori26](https://twitter.com/makomori26)

## License

Sharaku is available under the MIT license. See the LICENSE file for more info.
