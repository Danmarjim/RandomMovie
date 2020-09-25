extension Networking {
  var popularMovies: PopularMoviesUseCase {
    return PopularMovies(repository: popularMoviesRespository)
  }
}
