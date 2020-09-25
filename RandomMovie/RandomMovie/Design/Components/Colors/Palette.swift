import UIKit

protocol Mode {
  var background: UIColor { get }
  var text: UIColor { get }
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
