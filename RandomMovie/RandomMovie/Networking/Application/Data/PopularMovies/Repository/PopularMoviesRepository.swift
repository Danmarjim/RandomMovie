import RxSwift

struct PopularMoviesRepository {
  
  private let apiDataSource: PopularMoviesDataSource
  
  init(apiDataSource: PopularMoviesDataSource) {
    self.apiDataSource = apiDataSource
  }
  
  func list() -> Single<ListMovies> {
    return apiDataSource.list()
  }
}

// MARK: - Networking
extension Networking {
  var popularMoviesRespository: PopularMoviesRepository {
    return PopularMoviesRepository(apiDataSource: popularMoviesDataSource)
  }
  
  private var popularMoviesDataSource: PopularMoviesDataSource {
    return PopularMoviesApiDataSource(provider: moya(),
                                      listMapper: PopularMoviesApiToDomainMapper())
  }
}
