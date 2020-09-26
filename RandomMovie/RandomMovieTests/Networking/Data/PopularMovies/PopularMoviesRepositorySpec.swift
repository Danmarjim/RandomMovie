import XCTest
import OHHTTPStubs
import RxBlocking
@testable import RandomMovie

final class PopularMoviesRepositorySpec: XCTestCase {
  
  private var sut: PopularMoviesRepository!
  
  override func setUp() {
    super.setUp()
    sut = networking.popularMoviesRespository
  }
  
  override func tearDown() {
    sut = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func test_get_popular_movies() {
    givenPopularMovies()
    XCTAssertNoThrow(try sut.list().toBlocking().first())
    let response = try? sut.list().toBlocking().first()
    XCTAssertNotNil(response?.movies, "Nil????? Seriously ....")
  }
}

extension PopularMoviesRepositorySpec {
  private func givenPopularMovies() {
    stub(condition: pathMatches("/api")) { _ in
      return HTTPStubsResponse(jsonObject: Fixture.load("popular.movies.ok"),
                               statusCode: 200,
                               headers: nil
      )
    }
  }
}

