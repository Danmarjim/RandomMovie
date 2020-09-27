import MBProgressHUD
import SnapKit

extension UIViewController {
  
  func showLoadingView() {
    removeLoading()
    
    let view = loadingView()
    view.show(animated: true)
    view.backgroundView.style = .solidColor
    view.backgroundView.color = .init(white: 0.0, alpha: 0.2)
    
    currentView.addSubview(view)
    currentView.bringSubviewToFront(view)
    view.snp.makeConstraints { make in
      make.edges.equalTo(currentView)
    }
  }
  
  func hideLoadingView() {
    removeLoading()
  }
  
  private func removeLoading() {
    guard let view = currentView.viewWithTag(loadingTag) else { return }
    view.removeFromSuperview()
  }
  
  private func loadingView() -> MBProgressHUD {
    let view = MBProgressHUD(frame: .zero)
    view.tag = loadingTag
    return view
  }
  
  private var currentView: UIView {
    return parent?.view ?? view
  }
  
  private var loadingTag: Int {
    return 1
  }
}
