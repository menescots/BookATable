//
//  MenuDishCell.swift
//  BookATable
//
//  Created by Agata Menes on 05/04/2023.
//

import SwiftUI

struct MenuDishCell: View {
    let dishName: String
    let dishIngredients: String
    let dishPrice: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
               Text(dishName)
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(Color(.white))
                Text(dishIngredients)
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color(.white))
            }
            .padding(.trailing, 30)
            
            VStack{
                Spacer()
                Text("\(dishPrice) PLN")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color(.white))
            }
        }
        .frame(height: 100)
        .background(.clear)
    }
}

struct MenuDishCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuDishCell(dishName: "", dishIngredients: "", dishPrice: 0)
    }
}
