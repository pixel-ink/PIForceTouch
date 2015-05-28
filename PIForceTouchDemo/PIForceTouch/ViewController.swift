
import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var demoView: DemoView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    demoView.layer.borderColor = UIColor.whiteColor().CGColor
    demoView.layer.borderWidth = 1.0
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

