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
        autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
    }
}
