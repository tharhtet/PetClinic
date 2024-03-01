//
//  HomeCoordinator.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/8/24.
//

import Foundation
import UIKit

class HomeCoordinator: BaseCoordinator {
    private let viewModel: HomeViewModel
    var window: UIWindow?
    
    init(window: UIWindow?, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.window = window
    }
    
    override func start() {
        let viewController = HomeViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = true
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        self.windowRootAnimation(window: window)
    }

}


extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func redirectMyPets() {
        let coordinator = SceneDelegate.container.resolve(MyPetCoordinator.self)!
        coordinator.navigationVC = self.navigationVC
        start(coordinator: coordinator)
    }
    
    func didSignOut() {
        let coordinator = SceneDelegate.container.resolve(SignInCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        coordinator.window = window
        start(coordinator: coordinator)
    }
}
