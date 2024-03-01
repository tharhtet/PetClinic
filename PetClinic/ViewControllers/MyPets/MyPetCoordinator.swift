//
//  MyPetCoordinator.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/11/24.
//

import Foundation
import UIKit

class MyPetCoordinator: BaseCoordinator {
    private let viewModel: MyPetViewModel
    var vc: MyPetViewController?
    
    init(viewModel: MyPetViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = MyPetViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        vc = viewController
        navigationVC.pushViewController(viewController, animated: true)
    }

}


extension MyPetCoordinator: MyPetViewModelCoordinatorDelegate {
    func didAddPetScreen() {
        let coordinator = SceneDelegate.container.resolve(AddPetCoordinator.self)!
        navigationVC.navigationBar.isHidden = false
        coordinator.navigationVC = navigationVC
        coordinator.vc = vc
        start(coordinator: coordinator)
    }
    
    func didSignOut() {
        let coordinator = SceneDelegate.container.resolve(SignInCoordinator.self)!
        let navigation = BaseNavigationController()
        coordinator.navigationVC = navigation
        start(coordinator: coordinator)
    }
}
