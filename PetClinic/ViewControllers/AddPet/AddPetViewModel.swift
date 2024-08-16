//
//  AddPetViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/12/24.
//

import Foundation

protocol AddPetViewModelCoordinatorDelegate: class {
    
}

protocol AddPetViewModelProtocol {
    var coordinatorDelegate: AddPetViewModelCoordinatorDelegate? {get set}
}

class AddPetViewModel: AddPetViewModelProtocol {
    weak var coordinatorDelegate: AddPetViewModelCoordinatorDelegate?
    
}
