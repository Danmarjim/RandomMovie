import RxSwift

struct PopularMovies: PopularMoviesUseCase {
  
  private let repository: PopularMoviesRepository
  
  init(repository: PopularMoviesRepository) {
    self.repository = repository
  }
  
  func execute() -> Single<ListMovies> {
    return repository.list()
  }
}
