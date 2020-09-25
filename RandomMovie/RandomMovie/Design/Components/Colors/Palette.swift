import UIKit

protocol Variation {
  var backgroundColor: UIColor { get }
}

protocol GrayScale {
  var ink: UIColor { get }
}

protocol Mode {
  var main: Variation { get }
  var textColor: UIColor { get }
}

protocol PaletteProtocol {
  static var mode: Mode { get }
}

// MARK: - Default Palette
struct Palette: PaletteProtocol {
  static var mode: Mode {
    return assembly.mode
  }
}
