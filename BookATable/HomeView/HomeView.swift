//
//  HomeView.swift
//  BookATable
//
//  Created by Agata Menes on 28/03/2023.
//

import SwiftUI

struct HomeView: View {
    @State var pushView = false
    var body: some View {
            NavigationStack {
                ScrollView() {
                    
                    SearchHeaderView(cityName: "City")
                    
                    Text("Popular restaurants")
                        .foregroundColor(Color("DarkBlue"))
                        .font(.custom("AvenirNext-Regular", fixedSize: 25))
                        .fontWeight(.regular)
                        .padding(.top, 30)
                        .padding(.leading, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15) {
                        ForEach(0..<10) { restaurant in
                            NavigationLink(destination: RestaurantDetailView()) {
                                RestaurantListScrollViewCell(restaurantName: "RAGU", costliness: 2)
                            }
                        }
                    }
                    .cornerRadius(20)
                    .padding(.bottom, 15)
                }
                .navigationBarHidden(true)
                .ignoresSafeArea()
            }
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
