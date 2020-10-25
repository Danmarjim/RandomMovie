import UIKit
import paper_onboarding

final class OnBoardingViewController: UIViewController {
  
  var onBoardingView: OnBoardingView?
  
  override func loadView() {
    super.loadView()
    view = onBoardingView as? UIView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}
 
