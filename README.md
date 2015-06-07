
# PIForceTouch

## Force Touch for iOS (swift)
## NOTICE: Try in your device, not simulator.

![](https://cocoapod-badges.herokuapp.com/l/PIForceTouch/badge.png)
![](https://cocoapod-badges.herokuapp.com/v/PIForceTouch/badge.png)
![](https://cocoapod-badges.herokuapp.com/p/PIForceTouch/badge.png)

---

#demo

![demo](https://raw.github.com/wiki/pixel-ink/PIRipple/pif.gif)

---

# demo

- cd PIForceTouchDemo
- pod install
- open PIForceTouch.xcworkspace

# install

- manually
  - add PIForceTouchView.swift into your project
- cocoapods
  - add " pod 'PIForceTouch', '0.1.1' " into your Podfile
  - add " import PIForceTouch " into your code

# usage

- import PIForceTouch
- add PIForchTouchView into your UIViewController
- set delegate your view. (PIForceTouchViewDelegate)
- write callback

```
@objc protocol PIForceTouchViewDelegate {

  //like UIButton's Delegate
  optional func touchUpInside(touch: UITouch)
  optional func forceTouchUpInside(touch: UITouch)

  //like UIView's Delegate
  optional func beganTouch(touch: UITouch)
  optional func beganForceTouch(touch: UITouch)
  optional func endedAllTouch(touch: UITouch)
  optional func cancelledAllTouch(touch: UITouch)

}
```

- example

```
import UIKit
import PIForceTouch

class ViewController: UIViewController, PIForceTouchViewDelegate {

  @IBOutlet var piftView: PIForceTouchView!

  override func viewDidLoad() {
    super.viewDidLoad()
    piftView.delegate = self
  }

  func forceTouchUpInside(touch: UITouch) {
    println("ForceTouched")
  }

}

```
