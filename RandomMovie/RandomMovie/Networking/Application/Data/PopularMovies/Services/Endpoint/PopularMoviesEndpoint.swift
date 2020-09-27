import Moya

struct PopularMoviesEndpoint: Endpoint {
  
  var path: String {
    return "movie/popular"
  }
  
  var method: Method {
    return .get
  }
  
  var task: Task {
    guard let parameters = parameters() else { return .requestPlain }
    return .requestParameters(parameters: parameters,
                                encoding: URLEncoding.default)
  }
  
  func parameters() -> [String: Any]? {
    return ["api_key": Service.apiKey,
            "page": Int.random(in: 1..<500)]
  }
}
