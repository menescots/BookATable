//
//  FirebaseManager.swift
//  BookATable
//
//  Created by Agata Menes on 14/06/2023.
//

import Foundation
import Firebase

struct FirebaseManager {
    static let shared = FirebaseManager()
    
    public init() {
    }
    func createUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
            Auth.auth().createUser(withEmail: email, password: password, completion: completion)
        }
        
        func saveUserData(userId: String, userData: [String: Any], completion: @escaping (Error?) -> Void) {
            let ref = Database.database().reference().child("users").child(userId)
            ref.setValue(userData, withCompletionBlock: { (error, _) in
                completion(error)
            })
        }
    

    
    func signIntoFirebase(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                UserDefaultsManager.shared.saveLoggedInState(true)
                UserDefaultsManager.shared.saveUserEmail(email)
                
            }
        }
    }
}
