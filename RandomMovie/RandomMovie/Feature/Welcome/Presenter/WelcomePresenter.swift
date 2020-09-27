protocol WelcomePresenter: class, AutoMockable {
  var ui: WelcomeUI? { get set }
  func didLoad()
  func didTapOnRefreshButton()
}
