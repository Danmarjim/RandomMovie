final class DefaultHomePresenter: HomePresenter {
  
  var ui: HomeUI?
  private let interactor: HomeInteractor
  
  init(interactor: HomeInteractor) {
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

extension DefaultHomePresenter: HomeInteractorDelegate {
  func didLoad(popularMovies: ListMovies) {
    ui?.hideLoading()
    guard let randomMovie = popularMovies.movies.randomElement() else { return }
    ui?.setupUI(with: randomMovie)
  }
  
  func didFailLoadPopularMovies(with error: Error) {
    ui?.hideLoading()
  }
}
