//
//  SignInView.swift
//  BookATable
//
//  Created by Agata Menes on 12/05/2023.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View, SecuredTextFieldParentProtocol {
    var hideKeyboard: (() -> Void)?
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var vm: UserStateViewModel
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image("cutlery1")
                           .resizable()
                           .frame(width: 60, height: 60)
                           .scaledToFit()
                   }
                   .frame(width: 100, height: 100)
                   .background(Color("DarkBlue"))
                   .cornerRadius(50)
                   .padding(.top, 100)
                   
                   Text("Log In")
                       .foregroundColor(.black)
                       .font(.custom("cochin", fixedSize: 45))
                       .fontWeight(.medium)
                       .padding(.bottom, 5)
                   
                   Text("Welcome back! It is time to eat something")
                       .foregroundColor(.black)
                       .font(.system(size: 15, weight: .thin))
                       .padding(.bottom, 15)
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
                   
                   SecuredTextFieldView(text: $password, parent: self)
                       .clipShape(Capsule())
                       .padding(10)
                       .overlay(RoundedRectangle(cornerRadius:10.0).strokeBorder(Color("DarkBlue"), style: StrokeStyle(lineWidth: 1.0)))
                       .frame(width: UIScreen.main.bounds.width - 70)
                       .padding(.bottom, 10)
                   
                   Button {
                       guard password.count > 6, !email.isEmpty else {
                           return
                       }
                       signIntoFirebase()
                   } label: {
                       HStack(alignment: .center) {
                           Text("Sign in")
                               .foregroundColor(.white)
                               .font(.system(size: 24, weight: .light))
                       }
                       .frame(width: UIScreen.main.bounds.width - 130 , height: 44)
                       .background(Color("DarkBlue"))
                       .cornerRadius(25)
                   }
                   .padding(.top, 20)
                   Spacer()
               }
           }
       }
    
    func signIntoFirebase() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                UserDefaultsManager.shared.saveLoggedInState(true)
                UserDefaultsManager.shared.saveUserEmail(email)
                withAnimation() {
                    vm.isMainLoginViewPresented = false
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
