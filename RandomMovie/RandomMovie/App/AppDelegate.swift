import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    configPalette()
    return true
  }
}

extension AppDelegate {
  private func configPalette() {
    let traitCollection = UITraitCollection()
    switch traitCollection.userInterfaceStyle {
    case .light, .unspecified:
      let mode = LightMode()
      assembly.set(mode)
    case .dark:
      let mode = DarkMode()
      assembly.set(mode)
    @unknown default:
      fatalError()
    }
  }
}
