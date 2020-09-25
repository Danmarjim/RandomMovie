final class DefaultWelcomePresenter: WelcomePresenter {
  
  var ui: WelcomeUI?
  private let interactor: WelcomeInteractor
  
  init(interactor: WelcomeInteractor) {
    self.interactor = interactor
  }
  
  func didLoad() {
    interactor.loadPopularMovies()
  }
}

extension DefaultWelcomePresenter: WelcomeInteractorDelegate {
  func didLoad(popularMovies: ListMovies) {
    guard let randomMovie = popularMovies.movies.randomElement() else { return }
    ui?.setupUI(with: randomMovie)
  }
  
  func didFailLoadPopularMovies(with error: Error) {
    //
  }
}
