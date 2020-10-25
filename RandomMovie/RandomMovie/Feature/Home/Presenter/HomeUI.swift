protocol HomeUI: class, AutoMockable {
  func showLoading()
  func hideLoading()
  func setupUI(with movie: Movie)
}
