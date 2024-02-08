//
//  WelcomeCoordinator.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import Foundation
import UIKit

class WelcomeCoordinator: BaseCoordinator {
    private let viewModel: WelcomeViewModel
    var window: UIWindow?
    
    init(window: UIWindow?, welcomeViewModel: WelcomeViewModel) {
        self.viewModel = welcomeViewModel
        self.window = window
    }
    
    override func start() {
        let viewController = WelcomeViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = true
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        self.windowRootAnimation(window: window)
    }

}


extension WelcomeCoordinator: WelcomeViewModelCoordinatorDelegate{
    func didTapOnRow() {
        let coordinator = SceneDelegate.container.resolve(SignInCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        start(coordinator: coordinator)
    }
}
