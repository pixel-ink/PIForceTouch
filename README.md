
# PIForceTouch

## Force Touch for iOS (swift)

![](https://cocoapod-badges.herokuapp.com/l/PIForceTouch/badge.png)
![](https://cocoapod-badges.herokuapp.com/v/PIForceTouch/badge.png)
![](https://cocoapod-badges.herokuapp.com/p/PIForceTouch/badge.png)

---

# install

- manually
  - add PIForceTouchView.swift into your project
- cocoapods
  - add " pod 'PIForceTouch', '0.1.1' " into your Podfile
  - add " import PIForceTouch " into your code

# usage

- add PIForchTouchView into your UIViewController
- set delegate

# demo
- cd PIForceTouchDemo
- pod install
- open PIForceTouch.xcworkspace

```
@objc protocol PIForceTouchViewDelegate {

  optional func touchUpInside(touch: UITouch)
  optional func forceTouchUpInside(touch: UITouch)

  optional func beganTouch(touch: UITouch)
  optional func beganForceTouch(touch: UITouch)
  optional func endedAllTouch(touch: UITouch)
  optional func cancelledAllTouch(touch: UITouch)

}
```