import Moya
import RxSwift

struct PopularMoviesApiDataSource: PopularMoviesDataSource {
  
  private let provider: MoyaProvider<PopularMoviesService>
  private let listMapper: PopularMoviesApiToDomainMapper
  
  init(provider: MoyaProvider<PopularMoviesService>,
       listMapper: PopularMoviesApiToDomainMapper) {
    self.provider = provider
    self.listMapper = listMapper
  }
  
  func list() -> Single<ListMovies> {
    return provider.rx
      .request(.list)
      .filterSuccessfulStatusCodes()
      .map(ListMoviesApiResponse.self)
      .map(listMapper.map)
  }
}
