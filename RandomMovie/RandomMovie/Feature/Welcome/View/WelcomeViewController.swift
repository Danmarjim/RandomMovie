import UIKit

final class WelcomeViewController: UIViewController {
  
  var presenter: WelcomePresenter?
  var welcomeView: WelcomeView?
  
  override func loadView() {
    super.loadView()
    welcomeView?.delegate = self
    view = welcomeView as? UIView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.didLoad()
  }
}

extension WelcomeViewController: WelcomeUI {
  func showLoading() {
    showLoadingView()
  }
  
  func hideLoading() {
    hideLoadingView()
  }
  
  func setupUI(with movie: Movie) {
    welcomeView?.setup(with: movie)
  }
}

extension WelcomeViewController: WelcomeViewDelegate {
  func didTapOnRefreshButton() {
    presenter?.didTapOnRefreshButton()
  }
}
