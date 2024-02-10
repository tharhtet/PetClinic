//
//  SignUpCoordinator.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/10/24.
//

import Foundation
import UIKit

class SignUpCoordinator: BaseCoordinator {
    private let viewModel: SignUpViewModel
    var window: UIWindow?
    
    init(window: UIWindow?, viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        self.window = window
    }
    
    override func start() {
        let viewController = SignUpViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        navigationVC.pushViewController(viewController, animated: true)
    }

}


extension SignUpCoordinator: SignUpViewModelCoordinatorDelegate {
    func skipToWelcomePage() {
//        let coordinator = SceneDelegate.container.resolve(SignInCoordinator.self)!
//        let navigation = BaseNavigationController()
//        coordinator.navigationVC = navigation
//        coordinator.window = window
//        start(coordinator: coordinator)
    }
}
