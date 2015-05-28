
import UIKit
import PIRipple

class ViewController: UIViewController, PIForceTouchDelegate {

  @IBOutlet weak var demoView: PIForceTouchView!
  @IBOutlet weak var messageLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    demoView.layer.borderColor = UIColor.whiteColor().CGColor
    demoView.layer.borderWidth = 1.0
    demoView.delegate = self
  }

  //delegate
  func beganTouch(touch: UITouch) {
    let location = touch.locationInView(demoView)
    var opt = Ripple.option()
    opt.radius = 50
    opt.borderColor = UIColor.whiteColor()
    opt.fillColor = UIColor.clearColor()
    Ripple.run(demoView, locationInView: location, option: opt)
    messageLabel.text = "Touch"
  }
  
  //delegate
  func forceTouch(touch: UITouch){
    let location = touch.locationInView(demoView)
    var opt = Ripple.option()
    opt.radius = 50
    opt.borderColor = UIColor.redColor()
    opt.fillColor = UIColor.redColor()
    Ripple.run(demoView, locationInView: location, option: opt)
    messageLabel.text = "Force Touch"
  }
  
  //delegate
  func cancelledTouch(touch: UITouch) {
    messageLabel.text = "　"
  }

  //delegate
  func endedTouch(touch: UITouch) {
    messageLabel.text = "　"
  }
  
}

