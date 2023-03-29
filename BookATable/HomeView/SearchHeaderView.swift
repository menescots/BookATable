//
//  SearchHeaderView.swift
//  BookATable
//
//  Created by Agata Menes on 28/03/2023.
//

import SwiftUI

struct SearchHeaderView: View {
    @State private var city: String = ""
    @State private var reservationDate = Date()
    @State private var numberOfPeople: Int = 1
    @State private var restaurantName: String = ""
    var body: some View {
        VStack(spacing: 10) {
            
            Text("BOOK A TABLE")
                .foregroundColor(.white)
                .font(.custom("cochin", fixedSize: 40))
                .fontWeight(.medium)
                .padding(.bottom, 15)
                .padding(.top, 72)
            
            Button(action: {
                
            }, label: {
                Text("City")
                Image(systemName: "mappin.and.ellipse")
                    .resizable()
                    .frame(width: 20, height: 15)
                    .foregroundColor(.black)
            })
            .frame(width: UIScreen.main.bounds.width - 90 ,height: 10)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1))
            .foregroundColor(.black)
            .padding(.horizontal, 30)
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Date")
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.black)
                })
                .frame(width: UIScreen.main.bounds.width/3, height: 10)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1))
                .foregroundColor(.black)
                .padding(.leading, 30)
                
                Button(action: {
                    
                }, label: {
                    Text("People")
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.black)
                })
                .frame(width: UIScreen.main.bounds.width/3, height: 10)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1))
                .foregroundColor(.black)
                .padding(.trailing, 30)
            }
            .padding(.bottom, 20)
            HStack{
                TextField("Search for restuarant...", text: $restaurantName)
                    .frame(height: 10)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1))
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                
                Button {
                    print("Search")
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                }
            }
            .padding(.bottom, 20)
        }
        .background(Color("DarkBlue"))
        .cornerRadius(20)
    }
}

struct SearchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHeaderView()
    }
}
