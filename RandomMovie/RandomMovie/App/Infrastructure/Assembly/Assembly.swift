final class Assembly {
  fileprivate static let shared = Assembly()
  var mode: Mode!
  
  func set(_ mode: Mode) {
    self.mode = mode
  }
}

var assembly: Assembly {
  return Assembly.shared
}
