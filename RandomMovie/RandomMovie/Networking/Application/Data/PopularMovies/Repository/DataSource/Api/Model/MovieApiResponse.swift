struct MovieApiResponse: Codable {
  let title: String?
  let overview: String?
  let releaseDate: String?
  
  enum CodingKeys: String, CodingKey {
    case title
    case overview
    case releaseDate = "release_date"
  }
}
