protocol WelcomeView {
  var delegate: WelcomeViewDelegate? { get set }
  func setup(with movie: Movie)
}
