import UIKit

final class HomeViewController: UIViewController {
  
  var presenter: HomePresenter?
  var homeView: HomeView?
  
  override func loadView() {
    super.loadView()
    homeView?.delegate = self
    view = homeView as? UIView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.didLoad()
  }
}

extension HomeViewController: HomeUI {
  func showLoading() {
    showLoadingView()
  }
  
  func hideLoading() {
    hideLoadingView()
  }
  
  func setupUI(with movie: Movie) {
    homeView?.setup(with: movie)
  }
}

extension HomeViewController: HomeViewDelegate {
  func didTapOnRefreshButton() {
    presenter?.didTapOnRefreshButton()
  }
}
