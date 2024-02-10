//
//  SignInViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/9/24.
//

import Foundation

protocol SignInViewModelCoordinatorDelegate: class {
    func signUpRedirectAction()
    func homeRedirectAction()
}

protocol SignInViewModelProtocol {
    var coordinatorDelegate: SignInViewModelCoordinatorDelegate? {get set}
}

class SignInViewModel: SignInViewModelProtocol {
    weak var coordinatorDelegate: SignInViewModelCoordinatorDelegate?
    var username: String = ""
    var password: String = ""
    
    func loginAction(completion: @escaping (Result<UserModel, Error>) -> Void) {
        UserManager.shared.loginWithEmail(username: username, password: password) { result in
            completion(result)
        }
    }
    
    func homeRedirectAction() {
        coordinatorDelegate?.homeRedirectAction()
    }
    
    func signUpRedirectAction() {
        coordinatorDelegate?.signUpRedirectAction()
    }
}
