//
//  HomeViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/8/24.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate: class {
    
}

protocol HomeViewModelProtocol {
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate? {get set}
}

class HomeViewModel: HomeViewModelProtocol {
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
}
