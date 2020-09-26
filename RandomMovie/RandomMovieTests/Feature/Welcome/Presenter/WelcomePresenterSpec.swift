import XCTest
@testable import RandomMovie

final class WelcomePresenterSpec: XCTestCase {
  
  private var ui: WelcomeUIMock!
  private var interactor: WelcomeInteractorMock!
  private var sut: DefaultWelcomePresenter!
  
  override func setUp() {
    super.setUp()
    ui = WelcomeUIMock()
    interactor = WelcomeInteractorMock()
    sut = DefaultWelcomePresenter(interactor: interactor)
    sut.ui = ui
  }
  
  func test_did_load_first_time() {
    sut.didLoad()
    thenLoadPopularMovies()
  }
}

// MARK: - THEN
extension WelcomePresenterSpec {
  private func thenLoadPopularMovies() {
    XCTAssertTrue(interactor.loadPopularMoviesCalled, "Should call popular movies service")
  }
}
