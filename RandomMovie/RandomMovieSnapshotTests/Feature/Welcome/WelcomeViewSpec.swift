import XCTest
@testable import RandomMovie

final class WelcomeViewSpec: XCTestCase {
  
  func test_initial_view() {
    assertSnapshot(with: view())
  }
}

extension WelcomeViewSpec {
  
  private func view() -> DefaultWelcomeView {
    let welcomeView = DefaultWelcomeView()
    welcomeView.setup()
    return welcomeView
  }
}
