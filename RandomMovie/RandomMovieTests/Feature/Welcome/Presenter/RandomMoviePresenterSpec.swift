import XCTest
@testable import RandomMovie

final class RandomMoviePresenterSpec: XCTestCase {
  
  private var ui: WelcomeUIMock!
  private var sut: DefaultWelcomePresenter!
  
  override func setUp() {
    super.setUp()
    ui = WelcomeUIMock()
    sut = DefaultWelcomePresenter()
    sut.ui = ui
  }
  
  func test_did_load_first_time() {
    sut.didLoad()
    thenLoadUI()
  }
}

// MARK: - THEN
extension RandomMoviePresenterSpec {
  
  private func thenLoadUI() {
    XCTAssertTrue(ui.setupUICalled, "Should setup the UI")
  }
}
