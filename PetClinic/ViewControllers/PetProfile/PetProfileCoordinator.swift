//
//  PetProfileCoordinator.swift
//  PetClinic
//
//  Created by Thant Han Linn on 3/6/24.
//

import Foundation
import UIKit

class PetProfileCoordinator: BaseCoordinator {
    private let viewModel: PetProfileViewModel
    var vc: PetProfileViewController?
    
    init(viewModel: PetProfileViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = PetProfileViewController.instantiate()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        vc = viewController
        navigationVC.pushViewController(viewController, animated: true)
    }

}


extension PetProfileCoordinator: PetProfileViewModelCoordinatorDelegate {
    
}
