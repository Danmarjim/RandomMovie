struct Movie {
  let title: String
  let overview: String
  let releaseDate: String
  
  init(apiResponse: MovieApiResponse) {
    self.title = apiResponse.title ?? ""
    self.overview = apiResponse.overview ?? ""
    self.releaseDate = apiResponse.releaseDate ?? ""
  }
  
  fileprivate init(title: String,
                   overView: String,
                   releaseDate: String) {
    self.title = title
    self.overview = overView
    self.releaseDate = releaseDate
  }
}

extension Movie {
  static var mock: Movie {
    return Movie(title: "Money Plane",
                 overView: "A professional thief with $40 million.",
                 releaseDate: "2020-09-29")
  }
}
