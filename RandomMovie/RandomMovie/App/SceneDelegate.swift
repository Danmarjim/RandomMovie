import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard (scene as? UIWindowScene) != nil else { return }
    if let windowScene = scene as? UIWindowScene {
      self.window = UIWindow(windowScene: windowScene)
      self.window?.rootViewController = setRootViewController()
      self.window?.makeKeyAndVisible()
    }
  }
  
  private func setRootViewController() -> UIViewController {
    let rootViewController = assembly.welcomeViewController()
//    let navigationViewController = UINavigationController(rootViewController: rootViewController)
    return rootViewController
  }
}

