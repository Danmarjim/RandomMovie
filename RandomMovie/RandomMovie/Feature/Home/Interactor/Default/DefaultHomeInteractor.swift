import RxSwift

final class DefaultHomeInteractor: HomeInteractor {
  
  weak var delegate: HomeInteractorDelegate?
  private let popularMovies: PopularMoviesUseCase
  private let bag = DisposeBag()
  
  init(popularMovies: PopularMoviesUseCase) {
    self.popularMovies = popularMovies
  }
  
  func loadPopularMovies() {
    popularMovies.execute().subscribe(onSuccess: { [weak self] movies in
      self?.delegate?.didLoad(popularMovies: movies)
    }, onError: { [weak self] error in
      self?.delegate?.didFailLoadPopularMovies(with: error)
    }).disposed(by: bag)
  }
}
