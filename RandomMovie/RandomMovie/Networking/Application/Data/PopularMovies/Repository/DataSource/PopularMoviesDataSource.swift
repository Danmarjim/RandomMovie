import RxSwift

protocol PopularMoviesDataSource {
  func list() -> Single<ListMovies>
}
