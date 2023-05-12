//
//  ReservationSummary.swift
//  BookATable
//
//  Created by Agata Menes on 27/04/2023.
//

import SwiftUI

struct ReservationSummary: View {
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        if (vm.isLogged) {
            SignInView()
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
