struct Movie {
  let title: String
  let overview: String
  let releaseDate: String
  
  init(apiResponse: MovieApiResponse) {
    self.title = apiResponse.title ?? ""
    self.overview = apiResponse.overview ?? ""
    self.releaseDate = apiResponse.releaseDate ?? ""
  }
}
