import XCTest
import RxSwift
@testable import RandomMovie

var emptyError: Error {
  return NSError(domain: "domain", code: 0, userInfo: ["":""]) as Error
}

final class HomeInteractorSpec: XCTestCase {
  
  private var delegate: HomeInteractorDelegateMock!
  private var listMovies: PopularMoviesUseCaseMock!
  private var sut: HomeInteractor!
  
  override func setUp() {
    super.setUp()
    delegate = HomeInteractorDelegateMock()
    listMovies = PopularMoviesUseCaseMock()
    sut = DefaultHomeInteractor(popularMovies: listMovies)
    sut.delegate = delegate
  }
  
  func test_load_popular_movies() {
    listMovies.executeReturnValue = givenPopularMovies()
    sut.loadPopularMovies()
    thenDidLoadPopularMovies()
  }
  
  func test_fail_load_popular_movies() {
    listMovies.executeReturnValue = givenErrorPopularMovies()
    sut.loadPopularMovies()
    thenDidFailLoadPopularMovies()
  }
}

// MARK: - GIVEN
extension HomeInteractorSpec {
  private func givenPopularMovies() -> Single<ListMovies> {
    Single.create { event in
      event(.success(ListMovies.mock))
      return Disposables.create()
    }
  }
  
  private func givenErrorPopularMovies() -> Single<ListMovies> {
    return Single.create { event in
      event(.error(emptyError))
      return Disposables.create()
    }
  }
}

// MARK: - THEN
extension HomeInteractorSpec {
  private func thenDidLoadPopularMovies() {
    XCTAssertTrue(delegate.didLoadPopularMoviesCalled, "Should load popular movies")
  }
  
  private func thenDidFailLoadPopularMovies() {
    XCTAssertTrue(delegate.didFailLoadPopularMoviesWithCalled, "Should fail load popular movies")
  }
}
