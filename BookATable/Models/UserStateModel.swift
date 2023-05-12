//
//  UserStateModel.swift
//  BookATable
//
//  Created by Agata Menes on 08/05/2023.
//

import Foundation

enum UserStateError: Error{
    case signInError, signOutError
}

@MainActor
class UserStateViewModel: ObservableObject {
    
    @Published var isLogged = false
    @Published var isBusy = false
    
    func signIn(email: String, password: String) async -> Result<Bool, UserStateError>  {
        isBusy = true
        do{
            try await Task.sleep(nanoseconds:  1_000_000_000)
            isLogged = true
            isBusy = false
            return .success(true)
        }catch{
            isBusy = false
            return .failure(.signInError)
        }
    }
    
    func signOut() async -> Result<Bool, UserStateError>  {
        isBusy = true
        do{
            try await Task.sleep(nanoseconds: 1_000_000_000)
            isLogged = false
            isBusy = false
            return .success(true)
        }catch{
            isBusy = false
            return .failure(.signOutError)
        }
    }
}
