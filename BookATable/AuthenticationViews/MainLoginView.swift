//
//  MainLoginView.swift
//  BookATable
//
//  Created by Agata Menes on 12/05/2023.
//

import SwiftUI

struct MainLoginView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        VStack() {
            Spacer()
            
            ZStack {
                Image("cutlery1")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .scaledToFit()
            }
            .frame(width: 100, height: 100)
            .background(Color("DarkBlue"))
            .cornerRadius(50)
            
            Text("Book A Table")
                .foregroundColor(.black)
                .font(.custom("cochin", fixedSize: 45))
                .fontWeight(.medium)
                .padding(.bottom, 5)
            
            Text("Discover and book tables in the best restaurants")
                .foregroundColor(.black)
                .font(.system(size: 15, weight: .thin))
                .padding(.bottom, 15)
            
            Button {
                
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
            .padding(.top, 50)
            
            HStack {
                Text("I already have an account")
                    .font(.system(size: 15, weight: .thin))
                
                Button {
                    
                } label: {
                    HStack(alignment: .center) {
                        Text("Sign in")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.system(size: 15, weight: .regular))
                    }
                }
            }
            .padding(.top, 10)
            
            Spacer()
            
            VStack {
                Button {
                    vm.userLoginState = .continueWithoutAccount
                } label: {
                    HStack(alignment: .center) {
                        Text("Continue")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.system(size: 24, weight: .light))
                    }
                    .frame(width: UIScreen.main.bounds.width - 130 , height: 44)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("DarkBlue"), lineWidth: 1)
                    )
                }
                .padding(.top, 10)
            }
        }
    }
}

struct MainLoginView_Previews: PreviewProvider {
    static var previews: some View {
        MainLoginView()
    }
}
