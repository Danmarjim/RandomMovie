struct ListMovies {
  let movies: [Movie]
  
  init(apiResponse: ListMoviesApiResponse) {
    self.movies = apiResponse.results?.compactMap { Movie(apiResponse: $0) } ?? []
  }
}

