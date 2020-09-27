import UIKit
import SnapKit
import Kingfisher

final class DefaultWelcomeView: View, WelcomeView {
  
  weak var delegate: WelcomeViewDelegate?
  
  private var imageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFill
    return image
  }()
  
  private var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = false
    scrollView.backgroundColor = Palette.mode.background
    return scrollView
  }()
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = Palette.mode.text
    label.font = Fontbook.medium.xxl
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()
  
  private var overviewLabel: UILabel = {
    let label = UILabel()
    label.textColor = Palette.mode.text
    label.font = Fontbook.regular.l
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()
  
  private var refreshButton: UIButton = {
    let button = UIButton()
    button.setTitle("Refresh", for: .normal)
    button.setTitleColor(Palette.mode.text, for: .normal)
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
      make.top.equalTo(safeAreaLayoutGuide)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.height.equalTo(250)
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(-Spacing.xl)
      make.leading.equalToSuperview().offset(Spacing.s)
      make.trailing.equalToSuperview().offset(-Spacing.s)
    }
    scrollView.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
    overviewLabel.snp.makeConstraints { make in
      make.top.equalTo(scrollView).offset(Spacing.s)
      make.leading.equalTo(imageView).offset(Spacing.s)
      make.trailing.equalTo(imageView).offset(-Spacing.s)
      make.bottom.equalTo(scrollView.snp.bottom).offset(-Spacing.s)
    }
    refreshButton.snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.bottom).offset(Spacing.s)
      make.leading.equalToSuperview().offset(Spacing.s)
      make.trailing.equalToSuperview().offset(-Spacing.s)
      make.bottom.equalTo(safeAreaLayoutGuide)
    }
  }
  
  @objc func refreshAction(sender: UIButton) {
    delegate?.didTapOnRefreshButton()
  }
  
  func setup(with movie: Movie) {
    titleLabel.text = movie.title
    overviewLabel.text = movie.overview
    imageView.kf.setImage(with: movie.posterURL)
  }
}
