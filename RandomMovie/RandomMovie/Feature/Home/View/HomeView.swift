protocol HomeView {
  var delegate: HomeViewDelegate? { get set }
  func setup(with movie: Movie)
}
