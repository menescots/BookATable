//
//  BookATableApp.swift
//  BookATable
//
//  Created by Agata Menes on 28/03/2023.
//
import Firebase
import SwiftUI

@main
struct BookATableApp: App {
    @StateObject var userState =  UserStateViewModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userState)
        }
    }
}
