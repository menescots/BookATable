//
//  UserView.swift
//  BookATable
//
//  Created by Agata Menes on 12/04/2023.
//

import SwiftUI
import Firebase

struct UserView: View {
    @EnvironmentObject var vm: UserStateViewModel
    var body: some View {
        Button {
            vm.isLogged = false
        } label: {
            HStack(alignment: .center) {
                Text(vm.isLogged ? "Logout" : "")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .light))
            }
            .frame(width: UIScreen.main.bounds.width - 130 , height: 44)
            .background(Color("DarkBlue"))
            .cornerRadius(25)
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
        UserView()
    }
}
