import UIKit

public protocol Font {
  /// Value 32.
  var xxxl: UIFont { get }
  
  /// Value 24.
  var xxl: UIFont { get }
  
  /// Value 20.
  var xl: UIFont { get }
  
  /// Value 18
  var l: UIFont { get }
  
  /// Value 16.
  var m: UIFont { get }
  
  /// Value 14.
  var s: UIFont { get }
  
  /// Value 12.
  var xs: UIFont { get }
}

public protocol FontbookProtocol {
  static var regular: Font { get }
  static var medium: Font { get }
}

public struct Fontbook: FontbookProtocol {
  public static var regular: Font = {
    return MontserratRegularFont()
  }()
  
  public static var medium: Font = {
    return MontserratMediumFont()
  }()
}
