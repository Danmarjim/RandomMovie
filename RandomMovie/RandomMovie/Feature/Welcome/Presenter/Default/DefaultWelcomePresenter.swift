final class DefaultWelcomePresenter: WelcomePresenter {
  var ui: WelcomeUI?
  
  func didLoad() {
    ui?.setupUI()
  }
}
