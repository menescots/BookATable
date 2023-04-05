//
//  MenuModel.swift
//  BookATable
//
//  Created by Agata Menes on 05/04/2023.
//

import Foundation

struct MenuModel: Hashable, Identifiable {
    var id: String { dishName }
    let dishName: String
    let dishDesc: String
    let ingredients: String
    let price: Int
    let dishCategory: String
}
