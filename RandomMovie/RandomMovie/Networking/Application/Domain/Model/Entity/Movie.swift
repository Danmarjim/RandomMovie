import Foundation

struct Movie {
  let title: String
  let overview: String
  let releaseDate: String
  let poster: String
  
  var posterURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(poster)")!
  }
  
  init(apiResponse: MovieApiResponse) {
    self.title = apiResponse.title ?? ""
    self.overview = apiResponse.overview ?? ""
    self.releaseDate = apiResponse.releaseDate ?? ""
    self.poster = apiResponse.poster ?? ""
  }
  
  fileprivate init(title: String,
                   overView: String,
                   releaseDate: String,
                   poster: String) {
    self.title = title
    self.overview = overView
    self.releaseDate = releaseDate
    self.poster = poster
  }
}

extension Movie {
  static var mock: Movie {
    return Movie(title: "Money Plane",
                 overView: "A professional thief with $40 million.",
                 releaseDate: "2020-09-29",
                 poster: "/6CoRTJTmijhBLJTUNoVSUNxZMEI.jpg")
  }
}
