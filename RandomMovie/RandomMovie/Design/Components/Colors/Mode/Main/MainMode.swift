import UIKit

struct MainMode: Mode {
  let mainColor: Variation = MainVariation()
  let secondaryColor: Variation = SecondaryVariation()
  let preferredButtonTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  public init() {}
}
