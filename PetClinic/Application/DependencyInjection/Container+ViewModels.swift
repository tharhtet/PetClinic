//
//  Container+ViewModels.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerViewModels() {
        autoregister(WelcomeViewModel.self, initializer: WelcomeViewModel.init)
        autoregister(SignInViewModel.self, initializer: SignInViewModel.init)
        autoregister(SignUpViewModel.self, initializer: SignUpViewModel.init)
        autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
        autoregister(MyPetViewModel.self, initializer: MyPetViewModel.init)
        autoregister(AddPetViewModel.self, initializer: AddPetViewModel.init)
        autoregister(PetProfileViewModel.self, initializer: PetProfileViewModel.init)
    }
}
