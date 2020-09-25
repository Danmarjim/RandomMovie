import UIKit

struct LightMode: Mode {
  let main: Variation = LightVariation()
  let textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
  public init() {}
}
