// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import RandomMovie
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class WelcomePresenterMock: NSObject, WelcomePresenter {
    var ui: WelcomeUI?

    //MARK: - didLoad

    private(set) var didLoadCallsCount = 0
    var didLoadCalled: Bool {
        return didLoadCallsCount > 0
    }
    var didLoadClosure: (() -> Void)?

    func didLoad() {
        didLoadCallsCount += 1
        didLoadClosure?()
    }

}
class WelcomeUIMock: NSObject, WelcomeUI {

    //MARK: - setupUI

    private(set) var setupUICallsCount = 0
    var setupUICalled: Bool {
        return setupUICallsCount > 0
    }
    var setupUIClosure: (() -> Void)?

    func setupUI() {
        setupUICallsCount += 1
        setupUIClosure?()
    }

}
