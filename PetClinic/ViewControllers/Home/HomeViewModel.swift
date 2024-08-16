//
//  HomeViewModel.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/8/24.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate: class {
    func didSignOut()
    func redirectMyPets()
}

protocol HomeViewModelProtocol {
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate? {get set}
}

class HomeViewModel: HomeViewModelProtocol {
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    private var tabList: [TabModel] = []
    
    func fetchConfig(completion: @escaping (Result<[TabModel], Error>) -> Void) {
        PetsManager.shared.fetchConfig { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func didMyPetRedirectAction() {
        coordinatorDelegate?.redirectMyPets()
    }
    
    func didSignOut() {
        UserManager.shared.logout()
        LocalStorage.shared.setIsOnboarding(false)
        coordinatorDelegate?.didSignOut()
    }
}
