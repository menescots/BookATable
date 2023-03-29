//
//  RestaurantListScrollView.swift
//  BookATable
//
//  Created by Agata Menes on 28/03/2023.
//

import SwiftUI

struct RestaurantListScrollViewCell: View {
    let restaurantName: String
    let costliness: Int
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            Image("thai")
                .resizable()
                .scaledToFill()
                .frame(height: 140 )
                .clipped()
                .cornerRadius(20)
            
            LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                   .frame(height: 120)
                   .opacity(0.4)
                   .cornerRadius(20)
                VStack(alignment: .leading) {
                        Text(restaurantName)
                            .foregroundColor(.white)
                            .font(.title)
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .shadow(color: .black, radius: 2, x: -2)
                        Text("\(costliness)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .font(.system(size: 13))
                            .fontWeight(.medium)
                            .shadow(color: .black, radius: 2, x: -2)
                       
                    }
                .padding(10)
            
        }
        .padding(.horizontal, 10)
    }
}

struct RestaurantListScrollView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListScrollViewCell(restaurantName: "h", costliness: 2)
    }
}
