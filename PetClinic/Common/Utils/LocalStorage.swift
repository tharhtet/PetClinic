//
//  LocalStorage.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/12/24.
//

import Foundation

class LocalStorage {
    static let shared = LocalStorage()
    let userDefault = UserDefaults.standard
    
    func getIsOnboarding() -> Bool {
        return userDefault.bool(forKey: Constants.LocalStorage.isOnboarding)
    }
    
    func setIsOnboarding(_ flag: Bool) {
        userDefault.set(flag, forKey: Constants.LocalStorage.isOnboarding)
    }
}
