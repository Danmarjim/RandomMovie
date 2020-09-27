final class DefaultWelcomePresenter: WelcomePresenter {
  
  var ui: WelcomeUI?
  private let interactor: WelcomeInteractor
  
  init(interactor: WelcomeInteractor) {
    self.interactor = interactor
  }
  
  func didLoad() {
    ui?.showLoading()
    interactor.loadPopularMovies()
  }
  
  func didTapOnRefreshButton() {
    ui?.showLoading()
    interactor.loadPopularMovies()
  }
}

extension DefaultWelcomePresenter: WelcomeInteractorDelegate {
  func didLoad(popularMovies: ListMovies) {
    ui?.hideLoading()
    guard let randomMovie = popularMovies.movies.randomElement() else { return }
    ui?.setupUI(with: randomMovie)
  }
  
  func didFailLoadPopularMovies(with error: Error) {
    ui?.hideLoading()
  }
}
