//
//  UserDefaultsManager.swift
//  BookATable
//
//  Created by Agata Menes on 26/05/2023.
//

import Foundation

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    func saveValue(_ value: Any?, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    func getValue(forKey key: String) -> Any? {
        return defaults.value(forKey: key)
    }
    
    func saveLoggedInState(_ isLoggedIn: Bool) {
        saveValue(isLoggedIn, forKey: "isLoggedIn")
    }
    
    func isLoggedIn() -> Bool {
        return getValue(forKey: "isLoggedIn") as? Bool ?? false
    }
}
