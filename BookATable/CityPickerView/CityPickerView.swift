//
//  CityPickerView.swift
//  BookATable
//
//  Created by Agata Menes on 06/04/2023.
//

import SwiftUI

struct CityPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCity: String?
    var changeCityButtonTitle: (String) -> Void
     let cities = [
         "Warszawa",
         "Kraków",
         "Wrocław",
         "Łódź",
         "Poznań",
         "Bydgoszcz",
         "Szczecin",
         "Białystok",
         "Zielona góra",
         "Gdańsk",
         "Kostrzyn",
         "Lublin",
         
     ]

    var body: some View {
        VStack {
            NavigationStack {
                List(cities, id: \.self, selection: $selectedCity) { city in
                    Button {
                        self.changeCityButtonTitle(city)
                        dismiss()
                    } label: {
                        Text(city)
                            .foregroundColor(.black)
                            .font(.custom("AvenirNext-Regular", fixedSize: 23))
                            .fontWeight(.regular)
                            .padding(.vertical)
                    }
                        
                }
                .listStyle(.plain)
            }
            VStack {
                Button {
                    
                } label: {
                    HStack(alignment: .center) {
                        Image(systemName: "highlighter")
                            .foregroundColor(.white)
                        Text("Localize me")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .regular))
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 44)
                    .background(Color("DarkBlue"))
                    .cornerRadius(25)
                }
                .padding(.top, 10)
            }
            .frame(minWidth: UIScreen.main.bounds.width)
            .background(Color(.white))
        }
    }
}

struct CityPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CityPickerView(changeCityButtonTitle: { _ in })
    }
}
