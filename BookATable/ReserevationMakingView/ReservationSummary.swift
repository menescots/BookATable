//
//  ReservationSummary.swift
//  BookATable
//
//  Created by Agata Menes on 27/04/2023.
//

import SwiftUI

struct ReservationSummary: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State private var email: String
    @State private var phoneNumber: String?
    
    init() {
        _email = State(initialValue: UserDefaultsManager.shared.returnEmail())
    }
    var body: some View {
        if (UserDefaultsManager.shared.isLoggedIn()) {
            CustomTextField(titleKey: "Email", text: email)
            CustomTextField(titleKey: "Phone number", text: phoneNumber ?? "")
        } else {
            SignUpView()
        }
    }
}

struct ReservationSummary_Previews: PreviewProvider {
    static var previews: some View {
        ReservationSummary()
    }
}
