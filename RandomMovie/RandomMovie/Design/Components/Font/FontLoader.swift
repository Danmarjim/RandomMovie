import Foundation
import UIKit

enum FontType {
  case montserratRegularFont
  case montserratMediumFont
}

struct FontLoader {
  static func load(_ type: FontType, size: FontSize) -> UIFont {
    var fontPath = ""
    
    if let otfFontPath = Bundle.main.path(forResource: path(for: type), ofType: "ttf") {
      fontPath = otfFontPath
    } else {
      fatalError("Path for font type \(type) not found")
    }
    
    guard let fontData = NSData(contentsOfFile: fontPath) else {
      fatalError("Cannot load font data")
    }
    guard let provider = CGDataProvider(data: fontData) else {
      fatalError("Cannot create data provider for font")
    }
    
    let font = CGFont(provider)
    var error: Unmanaged<CFError>?
    CTFontManagerRegisterGraphicsFont(font!, &error)
    error?.release()
    return UIFont(name: file(for: type), size: CGFloat(size.rawValue))!
  }
  
  private static func path(for: FontType) -> String {
    switch `for` {
    case .montserratRegularFont:
      return "Montserrat-Regular"
    case .montserratMediumFont:
      return "Montserrat-Medium"
    }
  }
  
  private static func file(for: FontType) -> String {
    switch `for` {
    case .montserratRegularFont:
      return "Montserrat-Regular"
    case .montserratMediumFont:
      return "Montserrat-Medium"
    }
  }
}

