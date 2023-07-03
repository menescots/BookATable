//
//  ReservationSummary.swift
//  BookATable
//
//  Created by Agata Menes on 27/04/2023.
//

import SwiftUI

struct ReservationSummary: View, SecuredTextFieldParentProtocol {
    @Binding var email: String
    @Binding  var password: String
    @State private var phoneNumber: String?
    @State private var confirmPassword: String = ""
    @EnvironmentObject var vm: UserStateViewModel
    var hideKeyboard: (() -> Void)?
//    init() {
//        _email = State(initialValue: UserDefaultsManager.shared.returnEmail())
//    }
    var body: some View {
        if (UserDefaultsManager.shared.isLoggedIn()) {
            CustomTextField(titleKey: "Email", text: email)
            CustomTextField(titleKey: "Phone number", text: phoneNumber ?? "")
        } else {
            TextField(
                "Enter email...",
                text: $email
            )
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .clipShape(Capsule())
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius:10.0).strokeBorder(Color("DarkBlue"), style: StrokeStyle(lineWidth: 1.0)))
            .frame(width: UIScreen.main.bounds.width - 70, height: 44)
            .padding(.bottom, 10)
            .onChange(of: email, perform: { value in
                // Call the closure when variable1 changes
                updateVariables()
            })
            
            SecuredTextFieldView(text: $password, parent: self, placeholder: "Enter password")
                .clipShape(Capsule())
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius:10.0).strokeBorder(Color("DarkBlue"), style: StrokeStyle(lineWidth: 1.0)))
                .frame(width: UIScreen.main.bounds.width - 70)
                .padding(.bottom, 10)
                .onChange(of: email, perform: { value in
                    // Call the closure when variable1 changes
                    updateVariables()
                })
            //confirm password
            SecuredTextFieldView(text: $confirmPassword, parent: self, placeholder: "Confirm password")
                .clipShape(Capsule())
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius:10.0).strokeBorder(Color("DarkBlue"), style: StrokeStyle(lineWidth: 1.0)))
                .frame(width: UIScreen.main.bounds.width - 70)
                .padding(.bottom, 10)
            Spacer()
        }
    }
    
    private func updateVariables() {
    }
    func createUserAndSaveData() {
        FirebaseManager.shared.createUser(email: email, password: password) { (authResult, error) in
            if let user = authResult?.user {
                let userId = user.uid
                let userData = ["email": email, "phone": nil]
                
                FirebaseManager.shared.saveUserData(userId: userId, userData: userData as [String : Any]) { (error) in
                    if let error = error {
                        print("Error saving user data: \(error.localizedDescription)")
                    } else {
                        print("User data saved successfully")
                    }
                }
            } else if let error = error {
                print("Error creating user: \(error.localizedDescription)")
            }
        }
    }
}

struct ReservationSummary_Previews: PreviewProvider {
    static var previews: some View {
        ReservationSummary(email: .constant("dfff"), password: .constant("eve"))
    }
}
