
// https://github.com/pixel-ink/PIForceTouch

import UIKit

@objc public protocol PIForceTouchViewDelegate {

  optional func touchUpInside(touch: UITouch)
  optional func forceTouchUpInside(touch: UITouch)
  
  optional func beganTouch(touch: UITouch)
  optional func beganForceTouch(touch: UITouch)
  optional func endedAllTouch(touch: UITouch)
  optional func cancelledAllTouch(touch: UITouch)
  
}

public class PIForceTouchView : UIView {
  
  public var delegate:PIForceTouchViewDelegate?
  public var threshold:CGFloat = 0
  public var isForce:Bool = false
  
  override public func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesBegan(touches, withEvent: event)
    for touch: AnyObject in touches {
      var t: UITouch = touch as! UITouch
      let rad = t.majorRadius
      threshold = rad * CGFloat(1.3)
      delegate?.beganTouch?(t)
      isForce = false
    }
  }
  
  override public func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesMoved(touches, withEvent: event)
    for touch: AnyObject in touches {
      var t: UITouch = touch as! UITouch
      let rad = t.majorRadius
      if rad > threshold && !isForce {
        delegate?.beganForceTouch?(t)
        isForce = true
      }
    }
  }
  
  override public func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesEnded(touches, withEvent: event)
    for touch: AnyObject in touches {
      var t: UITouch = touch as! UITouch
      let l = t.locationInView(self)
      if frame.origin.x < l.x && l.x < frame.origin.x + frame.size.width &&
         frame.origin.y < l.y && l.y < frame.origin.y + frame.size.height {
        if isForce {
          delegate?.forceTouchUpInside?(t)
        } else {
          delegate?.touchUpInside?(t)
        }
      }
      isForce = false
      delegate?.endedAllTouch?(t)
    }
  }
  
  override public func touchesCancelled(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesCancelled(touches, withEvent: event)
    for touch: AnyObject in touches {
      var t: UITouch = touch as! UITouch
      isForce = false
      delegate?.cancelledAllTouch?(t)
    }
  }

}
