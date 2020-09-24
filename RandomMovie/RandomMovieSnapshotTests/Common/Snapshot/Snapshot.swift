import SnapshotTesting
import SnapKit
import XCTest

extension XCTestCase {
  
  func assertSnapshot(with view: @autoclosure () -> UIView,
                      sizes: [DeviceSize] = [.seFirstGen, .elevenPro],
                      name: String = #function,
                      file: StaticString = #file,
                      line: UInt = #line,
                      record: Bool = false,
                      customConstraints: ((_ make: ConstraintMaker) -> Void)? = nil) {
    sizes.forEach { size in
      let testName = fileName(name: name, size: size)
      let snapshotView = snapshot(with: view(),
                                  deviceSize: size,
                                  customConstraints: customConstraints)
      let failure = verifySnapshot(matching: snapshotView,
                                   as: .image,
                                   record: record,
                                   file: file,
                                   testName: testName)
      
      guard let message = failure else { return }
      XCTFail(message, file: file, line: line)
    }
  }
  
  private func fileName(name: String, size: DeviceSize) -> String {
    return "\(name)\(size)"
  }
  
  private func snapshot(with view: UIView,
                        deviceSize: DeviceSize,
                        customConstraints: ((_ make: ConstraintMaker) -> Void)? = nil) -> UIView {
    let frame = CGRect(origin: .zero, size: deviceSize.rawValue)
    let superview = UIView(frame: frame)
    
    superview.addSubview(view)
    view.snp.makeConstraints { make in
      if let custom = customConstraints {
        custom(make)
      } else {
        make.edges.equalToSuperview()
      }
    }
    return superview
  }
}
