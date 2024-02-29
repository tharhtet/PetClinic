//
//  Container+Coordinators.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCoordinators() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(WelcomeCoordinator.self, initializer: WelcomeCoordinator.init)
        autoregister(SignInCoordinator.self, initializer: SignInCoordinator.init)
        autoregister(SignUpCoordinator.self, initializer: SignUpCoordinator.init)
        autoregister(HomeCoordinator.self, initializer: HomeCoordinator.init)
        autoregister(MyPetCoordinator.self, initializer: MyPetCoordinator.init)
        autoregister(AddPetCoordinator.self, initializer: AddPetCoordinator.init)
    }
}
