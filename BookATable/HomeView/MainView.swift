//
//  ContentView.swift
//  BookATable
//
//  Created by Agata Menes on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State var isMainLoginPresented = true
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().scrollEdgeAppearance = .none
    }
    var body: some View {
        
        if isMainLoginPresented {
            MainLoginView(isMainLoginPresented: $isMainLoginPresented)
        } else {
            TabView{
                HomeView(numberOfPeople: 2, cityName: "Choose City", reservationDate: Date())
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                ReservationsView()
                    .tabItem {
                        Label("Reservations", systemImage: "pencil.line")
                    }
                
                UserView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .tint(Color("DarkBlue"))
            .transition(.slide)
        }
        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
