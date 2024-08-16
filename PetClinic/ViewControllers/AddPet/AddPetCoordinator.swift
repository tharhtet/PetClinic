//
//  AddPetCoordinator.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/12/24.
//

import Foundation
import UIKit

class AddPetCoordinator: BaseCoordinator {
    private let viewModel: AddPetViewModel
    var vc: MyPetViewController?
    
    init(viewModel: AddPetViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = AddPetViewController.instantiate()
        
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        if let vc = vc {
            vc.present(viewController, animated: true)
        }
        //navigationVC.pushViewController(viewController, animated: true)
    }

}


extension AddPetCoordinator: AddPetViewModelCoordinatorDelegate {
    
}
