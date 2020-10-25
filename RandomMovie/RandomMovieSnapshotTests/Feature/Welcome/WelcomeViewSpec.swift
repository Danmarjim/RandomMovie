import XCTest
@testable import RandomMovie

final class WelcomeViewSpec: XCTestCase {
  
  func test_initial_view() {
    assertSnapshot(with: view(), record: true)
  }
}

extension WelcomeViewSpec {
  private func view() -> DefaultHomeView {
    let welcomeView = DefaultHomeView()
    welcomeView.setup(with: .mock)
    return welcomeView
  }
}
