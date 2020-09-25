protocol WelcomeInteractor: class, AutoMockable {
  var delegate: WelcomeInteractorDelegate? { get set }
  func loadPopularMovies()
}
