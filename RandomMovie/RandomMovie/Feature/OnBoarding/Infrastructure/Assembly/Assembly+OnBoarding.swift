protocol OnBoardingProvider {
  func onBoardingViewController() -> OnBoardingViewController
}

extension Assembly: OnBoardingProvider {
  func onBoardingViewController() -> OnBoardingViewController {
    let onBoardingViewController = OnBoardingViewController()
    onBoardingViewController.onBoardingView = onBoardingView
        
    return onBoardingViewController
  }
  
  private var onBoardingView: OnBoardingView {
    return DefaultOnBoardingView()
  }
}
