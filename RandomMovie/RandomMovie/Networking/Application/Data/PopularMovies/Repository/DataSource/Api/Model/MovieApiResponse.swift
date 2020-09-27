struct MovieApiResponse: Codable {
  let title: String?
  let overview: String?
  let releaseDate: String?
  let poster: String?
  
  enum CodingKeys: String, CodingKey {
    case title
    case overview
    case releaseDate = "release_date"
    case poster = "poster_path"
  }
}
