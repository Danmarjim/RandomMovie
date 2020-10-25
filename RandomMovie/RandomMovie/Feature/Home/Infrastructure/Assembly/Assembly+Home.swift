protocol HomeProvider {
  func homeViewController() -> HomeViewController
}

extension Assembly: HomeProvider {
  func homeViewController() -> HomeViewController {
    let homeViewController = HomeViewController()
    homeViewController.homeView = homeView
    
    let interactor = homeInteractor()
    let presenter = homePresenter(interactor: interactor)
    
    interactor.delegate = presenter as? DefaultHomePresenter
    presenter.ui = homeViewController
    homeViewController.presenter = presenter
    
    return homeViewController
  }
  
  private var homeView: HomeView {
    return DefaultHomeView()
  }
  
  private func homePresenter(interactor: HomeInteractor) -> HomePresenter {
    return DefaultHomePresenter(interactor: interactor)
  }
  
  private func homeInteractor() -> HomeInteractor {
    return DefaultHomeInteractor(popularMovies: networking.popularMovies)
  }
}
