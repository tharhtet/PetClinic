//
//  AppCoordinator.swift
//  PetClinic
//
//  Created by Thant Han Linn on 1/31/24.
//

import UIKit
import Swinject

class AppCoordinator: BaseCoordinator {
    
    //private var window = UIWindow(frame: UIScreen.main.bounds)
    private var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    static let container = Container()
    
    override func start(window: UIWindow?) {
        guard let window = window else { return }
        removeChildCoordinators()
        self.window = window
        self.showHomeScreen()
    }
    
    private func showTutorial() {
        let coordinator = SceneDelegate.container.resolve(WelcomeCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        start(coordinator: coordinator)
    }
    
    private func showSignInScreen() {
//        let coordinator = SceneDelegate.container.resolve(SignInCoordinator.self)!
//        let navigation = BaseNavigationController()
//        coordinator.navigationVC = navigation
//        coordinator.window = window
//        start(coordinator: coordinator)
    }
    
    private func showHomeScreen() {
//        let coordinator = SceneDelegate.container.resolve(MainTabCoordinator.self)!
//        let navigation = BaseNavigationController()
//        coordinator.navigationVC = navigation
//        coordinator.window = window
//        start(coordinator: coordinator)
    }
}
