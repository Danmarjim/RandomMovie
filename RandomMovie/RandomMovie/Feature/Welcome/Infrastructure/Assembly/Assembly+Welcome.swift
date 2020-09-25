protocol WelcomeProvider {
  func welcomeViewController() -> WelcomeViewController
}

extension Assembly: WelcomeProvider {
  func welcomeViewController() -> WelcomeViewController {
    let welcomeViewController = WelcomeViewController()
    welcomeViewController.welcomeView = welcomeView
    
    let interactor = welcomeInteractor()
    let presenter = welcomePresenter(interactor: interactor)
    
    interactor.delegate = presenter as? DefaultWelcomePresenter
    presenter.ui = welcomeViewController
    welcomeViewController.presenter = presenter
    
    return welcomeViewController
  }
  
  private var welcomeView: WelcomeView {
    return DefaultWelcomeView()
  }
  
  private func welcomePresenter(interactor: WelcomeInteractor) -> WelcomePresenter {
    return DefaultWelcomePresenter(interactor: interactor)
  }
  
  private func welcomeInteractor() -> WelcomeInteractor {
    return DefaultWelcomeInteractor(popularMovies: networking.popularMovies)
  }
}
