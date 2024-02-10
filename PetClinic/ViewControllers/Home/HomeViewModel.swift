//
//  HomeViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/8/24.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate: class {
    func didSignOut()
}

protocol HomeViewModelProtocol {
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate? {get set}
}

class HomeViewModel: HomeViewModelProtocol {
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    
    func didSignOut() {
        UserManager.shared.logout()
        coordinatorDelegate?.didSignOut()
    }
}
