struct PopularMoviesApiToDomainMapper: Mappable {
  func map(_ from: ListMoviesApiResponse) -> ListMovies {
    return ListMovies(apiResponse: from)
  }
}
