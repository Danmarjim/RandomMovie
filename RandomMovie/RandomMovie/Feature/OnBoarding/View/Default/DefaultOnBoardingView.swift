import paper_onboarding

final class DefaultOnBoardingView: View, OnBoardingView {
  
  weak var delgate: OnBoardingViewDelegate?
  
  fileprivate let items = [
    OnboardingItemInfo(informationImage: UIImage.init(named: "Hotels")!,
                       title: "Hotels",
                       description: "All hotels and hostels are sorted by hospitality rating",
                       pageIcon: UIImage.init(named: "Key")!,
                       color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                       titleColor: Palette.mode.preferredButtonTextColor, descriptionColor: Palette.mode.preferredButtonTextColor, titleFont: Fontbook.regular.xl, descriptionFont: Fontbook.regular.l),
    OnboardingItemInfo(informationImage: UIImage.init(named: "Banks")!,
                       title: "Banks",
                       description: "We carefully verify all banks before add them into the app",
                       pageIcon: UIImage.init(named: "Wallet")!,
                       color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                       titleColor: Palette.mode.preferredButtonTextColor, descriptionColor: Palette.mode.preferredButtonTextColor, titleFont: Fontbook.regular.xl, descriptionFont: Fontbook.regular.l),
    OnboardingItemInfo(informationImage: UIImage.init(named: "Stores")!,
                       title: "Stores",
                       description: "All local stores are categorized for your convenience",
                       pageIcon: UIImage.init(named: "Shopping-cart")!,
                       color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                       titleColor: Palette.mode.preferredButtonTextColor, descriptionColor: Palette.mode.preferredButtonTextColor, titleFont: Fontbook.regular.xl, descriptionFont: Fontbook.regular.l)
  ]
  
  private var paperView: PaperOnboarding = {
    return PaperOnboarding()
  }()
  
  override func setupView() {
    addSubview(paperView)
    
    setupInputActions()
  }
  
  private func setupInputActions() {
    paperView.dataSource = self
  }
  
  override func setupConstraints() {
    paperView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }
}

extension DefaultOnBoardingView: PaperOnboardingDataSource {
  func onboardingItemsCount() -> Int {
    3
  }
  
  func onboardingItem(at index: Int) -> OnboardingItemInfo {
    return items[index]
  }
}
