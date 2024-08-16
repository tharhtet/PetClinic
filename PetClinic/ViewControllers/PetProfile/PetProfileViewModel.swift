//
//  PetProfileViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 3/6/24.
//

import Foundation

protocol PetProfileViewModelCoordinatorDelegate: class {
    
}

protocol PetProfileViewModelProtocol {
    var coordinatorDelegate: PetProfileViewModelCoordinatorDelegate? {get set}
}

class PetProfileViewModel: PetProfileViewModelProtocol {
    weak var coordinatorDelegate: PetProfileViewModelCoordinatorDelegate?
    
}
