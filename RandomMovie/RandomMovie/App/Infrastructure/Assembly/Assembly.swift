final class Assembly {
  fileprivate static let shared = Assembly()
}

var assembly: Assembly {
  return Assembly.shared
}
