//
//  RestaurantMenuView.swift
//  BookATable
//
//  Created by Agata Menes on 05/04/2023.
//

import SwiftUI
// kazda restauracja ma swoje menu, swoje kategorie!

struct MenuView: View {
    @State private var choosenCategory = "Pasta"
    var dishes: [MenuModel] = [
        MenuModel(dishName: "pasta", dishDesc: "it is a very gut focaccia pikante", ingredients: "parmigiano reggiano, peperoncino, rucola", price: 39, dishCategory: "Pasta"),
        MenuModel(dishName: "starterro", dishDesc: "very gut brusketta italiano", ingredients: "parmigiano reggiano, peperoncino, rucola", price: 27, dishCategory: "Starters"),
        MenuModel(dishName: "deserto", dishDesc: "it is a very gut focaccia pikante", ingredients: "parmigiano reggiano, peperoncino, rucola", price: 39, dishCategory: "Deserts")
        ,
        MenuModel(dishName: "meat", dishDesc: "it is a very gut focaccia pikante", ingredients: "parmigiano reggiano, peperoncino, rucola", price: 39, dishCategory: "Meat")
    ]
    var body: some View {
        VStack(alignment: .center){
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(dishes, id: \.self) { dish in
                        Button {
                            choosenCategory = dish.dishCategory
                            print(dish.dishCategory)
                        } label: {
                            Text(dish.dishCategory)
                                .foregroundColor(Color(.darkGray))
                                .frame(height: 44)
                                .padding(.horizontal)
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 20,
                                        style: .continuous
                                    )
                                    .fill(.white)
                                )
                                .overlay {
                                    RoundedRectangle(
                                        cornerRadius: 20,
                                        style: .continuous
                                    )
                                    .stroke(Color(.lightGray), lineWidth: 1)
                                }
                        }
                        .padding(5)
                    }
                }
            }
            .padding(.horizontal, 10)
            
            ForEach(dishes.filter{ $0.dishCategory == choosenCategory}) { dish in
                    MenuDishCell(dishName: dish.dishName, dishIngredients: dish.ingredients, dishPrice: dish.price)
                    Divider()
                        .overlay(Color(.lightGray))
            }
        }
            .frame(width: UIScreen.main.bounds.width)
        }
}

struct RestaurantMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
