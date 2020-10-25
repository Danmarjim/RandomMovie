import UIKit

public enum PrimaryButtonMode {
  case regular
}

private enum ViewLayout {
  static let buttonHeight = CGFloat(48)
  static let radius = CGFloat(24)
}

open class PrimaryButton: UIButton {
  
  private var viewModel: PrimaryButtonViewModel = {
    return RegularPrimaryButtonModel()
  }()
  
  open override var isHighlighted: Bool {
    didSet {
      if isHighlighted {
        configure(for: .highlighted, mode: mode)
      } else {
        configure(for: .normal, mode: mode)
      }
    }
  }
  
  open override var isEnabled: Bool {
    didSet {
      if isEnabled {
        configure(for: .normal, mode: mode)
      } else {
        configure(for: .disabled, mode: mode)
      }
    }
  }
  
  private let mode: PrimaryButtonMode
  
  init(_ mode: PrimaryButtonMode = .regular) {
    self.mode = mode
    super.init(frame: .zero)
    configure(with: mode)
  }
  
  required public init?(coder aDecoder: NSCoder) { fatalError() }
  
  private func configure(with mode: PrimaryButtonMode) {
    viewModel = buildViewModel(mode: mode)
    configure(for: state,
              mode: mode)
  }
  
  private func buildViewModel(mode: PrimaryButtonMode) -> PrimaryButtonViewModel {
    switch mode {
    case .regular:
      return RegularPrimaryButtonModel()
    }
  }
  
  private func configure(for state: UIControl.State, mode: PrimaryButtonMode) {
    titleLabel?.font = Fontbook.medium.l
    viewModel.state = state
    applyColors()
    applyConstraints()
  }
  
  private func applyColors() {
    guard let backgroundColor = viewModel.backgroundColor, let textColor = viewModel.textColor else { return }
    self.backgroundColor = backgroundColor
    titleLabel?.textColor =  textColor
  }
  
  private func applyConstraints() {
    snp.makeConstraints { make in
      make.height.equalTo(ViewLayout.buttonHeight)
    }
    titleEdgeInsets = UIEdgeInsets(top: Spacing.xs, left: Spacing.m, bottom: Spacing.xs, right: Spacing.m)
    layer.cornerRadius = ViewLayout.radius
  }
}
