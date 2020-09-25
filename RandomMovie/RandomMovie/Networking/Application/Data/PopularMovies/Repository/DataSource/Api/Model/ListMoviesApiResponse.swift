struct ListMoviesApiResponse: Codable {
  let results: [MovieApiResponse]?
  
  enum CodingKeys: String, CodingKey {
    case results
  }
}
