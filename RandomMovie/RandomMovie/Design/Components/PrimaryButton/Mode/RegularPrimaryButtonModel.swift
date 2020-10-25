import UIKit

class RegularPrimaryButtonModel: PrimaryButtonViewModel {
  var backgroundColor: UIColor?
  var textColor: UIColor?
  
  var state: UIControl.State = .normal {
    didSet {
      updateState()
    }
  }
  
  init(state: UIControl.State = .normal) {
    self.state = state
  }
  
  private func updateState() {
    switch state {
    case .normal:
      setColorsForNormalState()
    case .selected, .highlighted:
      setColorsForSelectedAndHighlightedStates()
    case .disabled:
      setColorsForDisabledState()
    default: break
    }
  }
  
  func setColorsForNormalState() {
    backgroundColor = Palette.mode.mainColor.regular
    textColor = Palette.mode.preferredButtonTextColor
  }
  
  func setColorsForSelectedAndHighlightedStates() {
    backgroundColor = Palette.mode.mainColor.dark
    textColor = Palette.mode.preferredButtonTextColor
  }
  
  func setColorsForDisabledState() {
    backgroundColor = Palette.mode.mainColor.light
    textColor = Palette.mode.preferredButtonTextColor
  }
}
