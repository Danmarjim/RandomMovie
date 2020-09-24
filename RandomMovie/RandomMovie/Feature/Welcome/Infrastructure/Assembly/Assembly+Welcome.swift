protocol WelcomeProvider {
  func welcomeViewController() -> WelcomeViewController
}

extension Assembly: WelcomeProvider {
  func welcomeViewController() -> WelcomeViewController {
    let welcomeViewController = WelcomeViewController()
    welcomeViewController.welcomeView = welcomeView
    
    var presenter = welcomePresenter()
    presenter.ui = welcomeViewController
    welcomeViewController.presenter = presenter
    
    return welcomeViewController
  }
  
  private var welcomeView: WelcomeView {
    return DefaultWelcomeView()
  }
  
  private func welcomePresenter() -> WelcomePresenter {
    return DefaultWelcomePresenter()
  }
}
