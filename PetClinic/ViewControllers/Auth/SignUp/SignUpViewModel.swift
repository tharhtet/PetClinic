//
//  SignUpViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/10/24.
//

import Foundation

protocol SignUpViewModelCoordinatorDelegate: class {
    
}

protocol SignUpViewModelProtocol {
    var coordinatorDelegate: SignUpViewModelCoordinatorDelegate? {get set}
}

class SignUpViewModel: SignUpViewModelProtocol {
    weak var coordinatorDelegate: SignUpViewModelCoordinatorDelegate?
}