import UIKit

struct DarkMode: Mode {
  let main: Variation = DarkVariation()
  let textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  public init() {}
}
