import UIKit

final class WelcomeViewController: UIViewController {
  var presenter: WelcomePresenter?
  var welcomeView: WelcomeView?
  
  override func loadView() {
    super.loadView()
    view = welcomeView as? UIView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    presenter?.didLoad()
  }
}

extension WelcomeViewController: WelcomeUI {
  func setupUI() {
    welcomeView?.setup()
  }
}
