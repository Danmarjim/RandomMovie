import UIKit

open class View: UIView {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  public init() {
    super.init(frame: .zero)
    setup()
  }
  
  private func setup() {
    backgroundColor = Palette.mode.background
    setupView()
    setupConstraints()
  }
  
  open func setupView() {
    fatalError()
  }
  
  open func setupConstraints() {
    fatalError()
  }
}
