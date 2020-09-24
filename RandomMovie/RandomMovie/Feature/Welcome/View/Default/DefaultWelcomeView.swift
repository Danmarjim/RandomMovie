import UIKit
import SnapKit

final class DefaultWelcomeView: UIView, WelcomeView {
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Hello world"
    label.font = Fontbook.medium.l
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  private func setupView() {
    addSubview(titleLabel)
    backgroundColor = .white
  }
  
  private func setupConstraints() {
    titleLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.equalToSuperview().offset(Spacing.l)
      make.trailing.equalToSuperview().offset(-Spacing.l)
    }
  }
  
  func setup() {
    setupView()
    setupConstraints()
  }
}
