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
    let mode = MainMode()
    assembly.set(mode)
  }
}
