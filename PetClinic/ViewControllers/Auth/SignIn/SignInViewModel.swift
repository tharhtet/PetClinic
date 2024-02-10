//
//  SignInViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/9/24.
//

import Foundation

protocol SignInViewModelCoordinatorDelegate: class {
    func loginAction()
}

protocol SignInViewModelProtocol {
    var coordinatorDelegate: SignInViewModelCoordinatorDelegate? {get set}
}

class SignInViewModel: SignInViewModelProtocol {
    weak var coordinatorDelegate: SignInViewModelCoordinatorDelegate?
    
    func loginAction() {
        coordinatorDelegate?.loginAction()
    }
}
