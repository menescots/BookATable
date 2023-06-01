//
//  UserView.swift
//  BookATable
//
//  Created by Agata Menes on 12/04/2023.
//

import SwiftUI
import Firebase

struct UserView: View {
    var isLogged = UserDefaultsManager.shared.isLoggedIn()
    @EnvironmentObject var vm: UserStateViewModel
    var body: some View {
        NavigationStack{
            Spacer()
            VStack(alignment: .leading) {
                //reload on logout
                Text("Hi \(UserDefaultsManager.shared.returnUsername())")
                    .foregroundColor(.black)
                    .font(.custom("cochin", fixedSize: 30))
                    .fontWeight(.medium)
                    .padding(.top, 20)
                Spacer()
                ZStack {
                    Button {
                        vm.isLogged = false
                        UserDefaultsManager.shared.saveLoggedInState(false)
                        UserDefaultsManager.shared.removeEmailValue()
                    } label: {
                        HStack(alignment: .center) {
                            Text(isLogged ? "Logout" : "")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .light))
                        }
                        .frame(width: UIScreen.main.bounds.width - 130 , height: 44)
                        .background(Color("DarkBlue"))
                        .cornerRadius(25)
                    }
                    .padding(.bottom, 10)
                    .opacity(isLogged ? 1 : 0)
                    .disabled(isLogged ? false : true)
                    
                    Button {
                        withAnimation(.some(.easeIn)){
                            vm.isMainLoginViewPresented = true
                        }
                    } label: {
                        HStack(alignment: .center) {
                            Text(isLogged ? "" : "SignUp / SignIn")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .light))
                        }
                        .frame(width: UIScreen.main.bounds.width - 130 , height: 44)
                        .background(Color("DarkBlue"))
                        .cornerRadius(25)
                    }
                    .opacity(isLogged ? 0 : 1)
                    .padding(.bottom, 10)

                }
            }
        }
    }
    func logOutFromFirebase() {
        do {
            try Auth.auth().signOut()
        } catch {
        print("Cannot sign out")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView().environmentObject(UserStateViewModel())
    }
}
