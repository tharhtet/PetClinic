//
//  Container+RegisterDependencies.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import Foundation
import Swinject

extension Container {
    func registerDependencies() {
        registerCoordinators()
        registerViewModels()
        //registerServices()
    }
}
