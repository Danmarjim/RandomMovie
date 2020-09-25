protocol WelcomeInteractorDelegate: class, AutoMockable {
  func didLoad(popularMovies: ListMovies)
  func didFailLoadPopularMovies(with error: Error)
}
