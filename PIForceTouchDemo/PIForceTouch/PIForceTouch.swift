
// https://github.com/pixel-ink/PIForceTouch

import UIKit

@objc protocol PIForceTouchDelegate {
  optional func beganTouch(touch: UITouch)
  optional func forceTouch(touch: UITouch)
  optional func endedTouch(touch: UITouch)
  optional func cancelledTouch(touch: UITouch)
}

class PIForceTouchView : UIView {
  
  var delegate:PIForceTouchDelegate?
  var threshold:CGFloat = 0
  var isForce:Bool = false
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesBegan(touches, withEvent: event)
    for touch: AnyObject in touches {
      var t: UITouch = touch as! UITouch
      let rad = t.majorRadius
      threshold = rad * CGFloat(1.3)
      delegate?.beganTouch?(t)
    }
  }
  
  override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesMoved(touches, withEvent: event)
    for touch: AnyObject in touches {
      var t: UITouch = touch as! UITouch
      let rad = t.majorRadius
      if rad > threshold && !isForce {
        delegate?.forceTouch?(t)
        isForce = true
      }
    }
  }
  
  override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesEnded(touches, withEvent: event)
    for touch: AnyObject in touches {
      var t: UITouch = touch as! UITouch
      isForce = false
      delegate?.endedTouch?(t)
    }
  }
  
  override func touchesCancelled(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesCancelled(touches, withEvent: event)
    for touch: AnyObject in touches {
      var t: UITouch = touch as! UITouch
      isForce = false
      delegate?.cancelledTouch?(t)
    }
  }

}
