import Moya

protocol Endpoint {
  var path: String { get }
  var method: Moya.Method { get }
  var task: Task { get }
  func parameters() -> [String: Any]?
}
