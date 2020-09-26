// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
import RxSwift
@testable import RandomMovie
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class PopularMoviesUseCaseMock: NSObject, PopularMoviesUseCase {

    //MARK: - execute

    private(set) var executeCallsCount = 0
    var executeCalled: Bool {
        return executeCallsCount > 0
    }
    var executeReturnValue: Single<ListMovies>!
    var executeClosure: (() -> Single<ListMovies>)?

    func execute() -> Single<ListMovies> {
        executeCallsCount += 1
        return executeClosure.map({ $0() }) ?? executeReturnValue
    }

}
class WelcomeInteractorMock: NSObject, WelcomeInteractor {
    var delegate: WelcomeInteractorDelegate?

    //MARK: - loadPopularMovies

    private(set) var loadPopularMoviesCallsCount = 0
    var loadPopularMoviesCalled: Bool {
        return loadPopularMoviesCallsCount > 0
    }
    var loadPopularMoviesClosure: (() -> Void)?

    func loadPopularMovies() {
        loadPopularMoviesCallsCount += 1
        loadPopularMoviesClosure?()
    }

}
class WelcomeInteractorDelegateMock: NSObject, WelcomeInteractorDelegate {

    //MARK: - didLoad

    private(set) var didLoadPopularMoviesCallsCount = 0
    var didLoadPopularMoviesCalled: Bool {
        return didLoadPopularMoviesCallsCount > 0
    }
    private(set) var didLoadPopularMoviesReceivedPopularMovies: ListMovies?
    private(set) var didLoadPopularMoviesReceivedInvocations: [ListMovies] = []
    var didLoadPopularMoviesClosure: ((ListMovies) -> Void)?

    func didLoad(popularMovies: ListMovies) {
        didLoadPopularMoviesCallsCount += 1
        didLoadPopularMoviesReceivedPopularMovies = popularMovies
        didLoadPopularMoviesReceivedInvocations.append(popularMovies)
        didLoadPopularMoviesClosure?(popularMovies)
    }

    //MARK: - didFailLoadPopularMovies

    private(set) var didFailLoadPopularMoviesWithCallsCount = 0
    var didFailLoadPopularMoviesWithCalled: Bool {
        return didFailLoadPopularMoviesWithCallsCount > 0
    }
    private(set) var didFailLoadPopularMoviesWithReceivedError: Error?
    private(set) var didFailLoadPopularMoviesWithReceivedInvocations: [Error] = []
    var didFailLoadPopularMoviesWithClosure: ((Error) -> Void)?

    func didFailLoadPopularMovies(with error: Error) {
        didFailLoadPopularMoviesWithCallsCount += 1
        didFailLoadPopularMoviesWithReceivedError = error
        didFailLoadPopularMoviesWithReceivedInvocations.append(error)
        didFailLoadPopularMoviesWithClosure?(error)
    }

}
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

    private(set) var setupUIWithCallsCount = 0
    var setupUIWithCalled: Bool {
        return setupUIWithCallsCount > 0
    }
    private(set) var setupUIWithReceivedMovie: Movie?
    private(set) var setupUIWithReceivedInvocations: [Movie] = []
    var setupUIWithClosure: ((Movie) -> Void)?

    func setupUI(with movie: Movie) {
        setupUIWithCallsCount += 1
        setupUIWithReceivedMovie = movie
        setupUIWithReceivedInvocations.append(movie)
        setupUIWithClosure?(movie)
    }

}
