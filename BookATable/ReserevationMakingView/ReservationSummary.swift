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
        if (vm.isLoggedIn) {
            Text("logged")
        } else {
            Text("not logged")
        }
    }
}

struct ReservationSummary_Previews: PreviewProvider {
    static var previews: some View {
        ReservationSummary()
    }
}
