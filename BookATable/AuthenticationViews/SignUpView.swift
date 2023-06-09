//
//  SignUpView.swift
//  BookATable
//
//  Created by Agata Menes on 08/05/2023.
//
import FirebaseAuth
import SwiftUI

struct SignUpView: View, SecuredTextFieldParentProtocol {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State var hideKeyboard: (() -> Void)?
    @State private var showingAlert = false
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        ScrollView{
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
                
                Text("Register")
                    .foregroundColor(.black)
                    .font(.custom("cochin", fixedSize: 45))
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
                
                Text("Discover and book tables in the best restaurants")
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
                
                SecuredTextFieldView(text: $password, parent: self, placeholder: "Enter password")
                    .clipShape(Capsule())
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius:10.0).strokeBorder(Color("DarkBlue"), style: StrokeStyle(lineWidth: 1.0)))
                    .frame(width: UIScreen.main.bounds.width - 70)
                    .padding(.bottom, 10)
                
                //confirm password
                SecuredTextFieldView(text: $confirmPassword, parent: self, placeholder: "Confirm password")
                    .clipShape(Capsule())
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius:10.0).strokeBorder(Color("DarkBlue"), style: StrokeStyle(lineWidth: 1.0)))
                    .frame(width: UIScreen.main.bounds.width - 70)
                    .padding(.bottom, 10)
                
                Button {
                    guard password.count > 6, confirmPassword == password, !email.isEmpty else {
                        print("no no go")
                        return
                    }
                    
                    createUserAndSaveData()
                    
                } label: {
                    HStack(alignment: .center) {
                        Text("Sign up")
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
    private func performHideKeyboard() {
        
        guard let hideKeyboard = self.hideKeyboard else {
            return
        }
        
        hideKeyboard()
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
                        print("halo tutaj powinno zalogowac")
                        FirebaseManager.shared.signIntoFirebase(email: email, password: password)
                        vm.isMainLoginViewPresented = false
                        vm.isLogged = true
                        print("User data saved successfully")
                    }
                }
                
            } else if let error = error {
                print("Error creating user: \(error.localizedDescription)")
            }
        }
    }
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
}
