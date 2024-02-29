//
//  WelcomeViewModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import Foundation
import UIKit

protocol WelcomeViewModelCoordinatorDelegate: class {
    func skipToWelcomePage()
}

protocol WelcomeViewModelProtocol {
    var coordinatorDelegate: WelcomeViewModelCoordinatorDelegate?{get set}
    func skipOnboarding()
}

class WelcomeViewModel: WelcomeViewModelProtocol {
    weak var coordinatorDelegate: WelcomeViewModelCoordinatorDelegate?
    
    func skipOnboarding() {
        LocalStorage.shared.setIsOnboarding(true)
        self.coordinatorDelegate?.skipToWelcomePage()
    }
}
