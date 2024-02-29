//
//  UserManagerApi.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/10/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

protocol UserManagerProtocol {
    func loginWithEmail(username: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
    func fetchUserData(userId: String, completion: @escaping (Result<UserModel, Error>) -> Void)
    func getUserId() -> String
    func isLoginAlready() -> Bool
    func logout()
}

class UserManager: UserManagerProtocol {
    // Singleton instance
    static let shared: UserManagerProtocol = UserManager()
    
    // Private initializer to prevent direct instantiation
    private init() {}
    
    func loginWithEmail(username: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            let user = UserModel(id: authResult?.user.uid ?? "", name: authResult?.user.displayName ?? "", email: authResult?.user.email ?? "")
            if let error = error {
                // Call completion handler with failure result
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
            
        }
    }
    
    func fetchUserData(userId: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        // Simulated asynchronous network request
        DispatchQueue.global().async {
            // Simulated user data
            let user = UserModel(id: userId, name: "John Doe", email: "john@example.com")
            // Simulated success
            DispatchQueue.main.async {
                completion(.success(user))
            }
        }
    }
    
    func getUserId() -> String {
        return Auth.auth().currentUser?.uid ?? ""
    }
    
    func isLoginAlready() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func logout() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

