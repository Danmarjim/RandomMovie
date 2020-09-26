struct ListMovies {
  let movies: [Movie]
  
  init(apiResponse: ListMoviesApiResponse) {
    self.movies = apiResponse.results?.compactMap { Movie(apiResponse: $0) } ?? []
  }
  
  fileprivate init(movies: [Movie]) {
    self.movies = movies
  }
}

extension ListMovies {
  static var mock: ListMovies {
    return ListMovies(movies: [.mock, .mock])
  }
}
