//
//  SignInCoordinator.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/9/24.
//

import Foundation
import UIKit

class SignInCoordinator: BaseCoordinator {
    private let viewModel: SignInViewModel
    var window: UIWindow?
    
    init(window: UIWindow?, viewModel: SignInViewModel) {
        self.viewModel = viewModel
        self.window = window
    }
    
    override func start() {
        let viewController = SignInViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.isHidden = true
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        self.windowRootAnimation(window: window)
    }

}


extension SignInCoordinator: SignInViewModelCoordinatorDelegate {
    func loginAction() {
        let coordinator = SceneDelegate.container.resolve(SignUpCoordinator.self)!
        coordinator.navigationVC = self.navigationVC
        start(coordinator: coordinator)
    }
}
