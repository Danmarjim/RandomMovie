import UIKit

enum DeviceSize: CaseIterable, RawRepresentable {
  case seFirstGen
  case elevenPro

  init?(rawValue: CGSize) { return nil }
  
  var rawValue: CGSize {
    switch self {
    case .seFirstGen:
      return CGSize(width: 320, height: 568)
    case .elevenPro:
      return CGSize(width: 375, height: 812)
    }
  }
}
