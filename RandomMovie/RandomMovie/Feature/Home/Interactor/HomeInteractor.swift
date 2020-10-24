protocol HomeInteractor: class, AutoMockable {
  var delegate: HomeInteractorDelegate? { get set }
  func loadPopularMovies()
}
