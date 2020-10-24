import UIKit
import SnapKit
import Kingfisher

private enum ViewLayout {
  static let imageHeight = CGFloat(450)
}

final class DefaultHomeView: View, HomeView {
  
  weak var delegate: HomeViewDelegate?
  
  private var imageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleToFill
    return image
  }()
  
  private var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = false
    return scrollView
  }()
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = Palette.mode.preferredButtonTextColor
    label.font = Fontbook.medium.xxl
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()
  
  private var overviewLabel: UILabel = {
    let label = UILabel()
    label.textColor = Palette.grayscale.ink
    label.font = Fontbook.regular.l
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()
  
  private var refreshButton: PrimaryButton = {
    let button = PrimaryButton(.regular)
    button.setTitle("Refresh", for: .normal)
    return button
  }()
  
  override func setupView() {
    addSubview(imageView)
    addSubview(titleLabel)
    scrollView.addSubview(overviewLabel)
    addSubview(scrollView)
    addSubview(refreshButton)
    
    setupInputActions()
  }
  
  private func setupInputActions() {
    refreshButton.addTarget(self, action: #selector(refreshAction), for: .touchUpInside)
  }
  
  override func setupConstraints() {
    imageView.snp.makeConstraints { make in
      make.top.equalTo(self)
      make.leading.equalTo(self)
      make.trailing.equalTo(self)
      make.height.equalTo(ViewLayout.imageHeight)
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(-Spacing.xl)
      make.leading.equalTo(self).offset(Spacing.s)
      make.trailing.equalTo(self).offset(-Spacing.s)
    }
    scrollView.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
    overviewLabel.snp.makeConstraints { make in
      make.top.equalTo(scrollView).offset(Spacing.l)
      make.leading.equalTo(imageView).offset(Spacing.s)
      make.trailing.equalTo(imageView).offset(-Spacing.s)
      make.bottom.equalTo(scrollView.snp.bottom).offset(-Spacing.s)
    }
    refreshButton.snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.bottom).offset(Spacing.s)
      make.leading.equalTo(imageView).offset(Spacing.s)
      make.trailing.equalTo(imageView).offset(-Spacing.s)
      make.bottom.equalTo(safeAreaLayoutGuide).offset(-Spacing.s)
    }
  }
  
  @objc func refreshAction(sender: UIButton) {
    delegate?.didTapOnRefreshButton()
  }
  
  func setup(with movie: Movie) {
    imageView.kf.setImage(with: movie.posterURL)
    titleLabel.text = movie.title
    overviewLabel.text = movie.overview
  }
}
