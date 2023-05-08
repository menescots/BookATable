//
//  BookATableApp.swift
//  BookATable
//
//  Created by Agata Menes on 28/03/2023.
//

import SwiftUI

@main
struct BookATableApp: App {
    @StateObject var userState =  UserStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userState)
        }
    }
}
