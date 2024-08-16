//
//  MyPetViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/11/24.
//

import Foundation

protocol MyPetViewModelCoordinatorDelegate: class {
    func didAddPetScreen()
    func didRedirectPetDetail()
    func didSignOut()
}

protocol MyPetViewModelProtocol {
    var coordinatorDelegate: MyPetViewModelCoordinatorDelegate? {get set}
}

class MyPetViewModel: MyPetViewModelProtocol {
    weak var coordinatorDelegate: MyPetViewModelCoordinatorDelegate?
    
    func didAddPetScreen() {
        coordinatorDelegate?.didAddPetScreen()
    }
    
    func didRedirectPetDetail() {
        coordinatorDelegate?.didRedirectPetDetail()
    }
    
    func didSignOut() {
        UserManager.shared.logout()
        coordinatorDelegate?.didSignOut()
    }
}
