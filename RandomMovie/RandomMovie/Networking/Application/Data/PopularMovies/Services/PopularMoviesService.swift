import Moya
import Foundation
import RxSwift

enum PopularMoviesService: TargetType {
  case list
}

extension PopularMoviesService {
  var baseURL: URL {
    return Service.baseUrl
  }
  
  var path: String {
    return endpoint(for: self).path
  }
  
  var method: Moya.Method {
    return endpoint(for: self).method
  }
  
  var task: Task {
    return endpoint(for: self).task
  }
}

private func endpoint(for service: PopularMoviesService) -> Endpoint {
  switch service {
  case .list:
    return PopularMoviesEndpoint()
  }
}
