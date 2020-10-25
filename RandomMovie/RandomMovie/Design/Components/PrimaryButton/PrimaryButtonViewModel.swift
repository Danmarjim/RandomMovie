import UIKit

protocol PrimaryButtonViewModel {
  var backgroundColor: UIColor? {get set}
  var textColor: UIColor? {get set}
  var state: UIControl.State {get set}
  
  func setColorsForNormalState()
  func setColorsForSelectedAndHighlightedStates()
  func setColorsForDisabledState()
}
