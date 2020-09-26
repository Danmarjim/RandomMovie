import Foundation
@testable import RandomMovie

class TestSetup: NSObject {
  override init() {
    setenv("BASE_URL", "http://mock.mock", 1)
    setenv("API_KEY", "MOCK", 1)
  }
}
