//
//  HomeView.swift
//  BookATable
//
//  Created by Agata Menes on 28/03/2023.
//

import SwiftUI

struct HomeView: View {
    @State var pushView = false
    @State var numberOfPeople: Int
    @State var cityName: String
    @State var reservationDate: String
    var body: some View {
            NavigationStack {
                ScrollView() {
                    
                    SearchHeaderView(reservationDate: $reservationDate, numberOfPeople: $numberOfPeople, cityName: $cityName)
                    
                    Text("Popular restaurants")
                        .foregroundColor(Color("DarkBlue"))
                        .font(.custom("AvenirNext-Regular", fixedSize: 25))
                        .fontWeight(.regular)
                        .padding(.top, 30)
                        .padding(.leading, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15) {
                        ForEach(0..<10) { restaurant in
                            
                            NavigationLink(destination: RestaurantDetailView(numberOfPeople: numberOfPeople, cityName: cityName, reservationDate: reservationDate, restaurantName: "RAGU")) {
                                RestaurantListScrollViewCell(restaurantName: "RAGU", costliness: 2)
                            }
                        }
                    }
                    .cornerRadius(20)
                    .padding(.bottom, 15)
                }
                .ignoresSafeArea()
                
            }
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(numberOfPeople: 2, cityName: "", reservationDate: "")
    }
}
