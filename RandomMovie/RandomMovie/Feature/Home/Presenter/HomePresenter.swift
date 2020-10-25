protocol HomePresenter: class, AutoMockable {
  var ui: HomeUI? { get set }
  func didLoad()
  func didTapOnRefreshButton()
}
