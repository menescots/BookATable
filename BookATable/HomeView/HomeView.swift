//
//  HomeView.swift
//  BookATable
//
//  Created by Agata Menes on 28/03/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            SearchHeaderView()
            Text("Popular restaurants")
                .foregroundColor(Color("DarkBlue"))
                .font(.custom("AvenirNext-Regular", fixedSize: 20))
                .fontWeight(.regular)
                .padding(.top, 15)
                .padding(.leading, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView() {
                VStack(spacing: 15) {
                    ForEach(0..<10) { restaurant in
                        RestaurantListScrollViewCell(restaurantName: "RAGU", costliness: 2)
                    }
                }
                .cornerRadius(20)
                .padding(.bottom, 15)
            }
            .ignoresSafeArea()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
