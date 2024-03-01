//
//  PetsManager.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/11/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

protocol PetsManagerProtocol {
    func fetchConfig(completion: @escaping (Result<[TabModel], Error>) -> Void)
}

class PetsManager: PetsManagerProtocol {
    // Singleton instance
    static let shared: PetsManagerProtocol = PetsManager()
    let db = Firestore.firestore()
    private var tabList: [TabModel] = []
    
    // Private initializer to prevent direct instantiation
    private init() {}
    
    func fetchConfig(completion: @escaping (Result<[TabModel], Error>) -> Void) {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        db.settings = settings
        
        db.collection("Config/Home/results")
            .order(by: "order", descending: false)
            .getDocuments(source: .cache) { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? ""
                    let iconName = data["iconName"] as? String ?? ""
                    let pageName = data["pageName"] as? String ?? ""
                    let obj = TabModel(name: name, nameMm: name, iconName: iconName, pageName: pageName)
                    self.tabList.append(obj)
                }
                completion(.success(self.tabList))
            }
        }
    }
}

