import RxSwift

protocol PopularMoviesUseCase {
  func execute() -> Single<ListMovies>
}
