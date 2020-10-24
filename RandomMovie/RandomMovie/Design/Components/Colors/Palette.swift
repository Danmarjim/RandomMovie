import UIKit

public protocol Variation {
  var regular: UIColor { get }
  var light: UIColor { get }
  var dark: UIColor { get }
}

protocol Mode {
  var mainColor: Variation { get }
  var secondaryColor: Variation { get }
  var preferredButtonTextColor: UIColor { get }
}

var preferredButtonTextColor: UIColor {
  return .white
}

public protocol GrayScale {
  var ink: UIColor { get }
  var inkLight: UIColor { get }
}

protocol PaletteProtocol {
  static var mode: Mode { get }
  static var grayscale: GrayScale { get }
}

// MARK: - Default Palette
struct Palette: PaletteProtocol {
  static var mode: Mode {
    return assembly.mode
  }
  
  public static var grayscale: GrayScale {
    return StandardGrayScale()
  }
}
