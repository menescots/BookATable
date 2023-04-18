//
//  SearchHeaderView.swift
//  BookATable
//
//  Created by Agata Menes on 28/03/2023.
//

import SwiftUI

struct SearchHeaderView: View {
    @Binding var reservationDate: Date
    @Binding var numberOfPeople: Int
    @State private var restaurantName: String = ""
    @State private var showingOptions = false
    @Binding var cityName: String
    
    let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM hh:mm"
            return formatter
        }()
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text("BOOK A TABLE")
                .foregroundColor(.white)
                .font(.custom("cochin", fixedSize: 40))
                .fontWeight(.medium)
                .padding(.bottom, 15)
                .padding(.top, 72)
            
            
            NavigationLink() {
                CityPickerView(changeCityButtonTitle: self.changeCityButtonTitle(city:))
            } label: {
                Text(cityName)
                Image(systemName: "mappin.and.ellipse")
                    .resizable()
                    .frame(width: 20, height: 15)
                    .foregroundColor(.black)
            }.frame(maxWidth: .infinity, maxHeight: 10)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1))
                .foregroundColor(.black)
                .padding(.horizontal, 30)

            
            HStack {
                NavigationLink() {
                    DatePickerView(changeDate: self.changeDate(date:), date: reservationDate)
                } label: {
                    Text("\(reservationDate, formatter: formatter)")
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, maxHeight: 10)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1))
                .foregroundColor(.black)
                .padding(.leading, 30)
                
                Button(action: {
                    showingOptions = true
                }, label: {
                    Text("\(numberOfPeople)")
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.black)
                })
                .frame(maxWidth: .infinity, maxHeight: 10)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1))
                .foregroundColor(.black)
                .padding(.trailing, 30)
                
                .confirmationDialog("Number of people", isPresented: $showingOptions) {
                    ForEach(2..<25) { number in
                        Button("\(number)") {
                            numberOfPeople = number
                        }
                    }
                }
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
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
        }
        .background(
                LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("LightViolet")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        .cornerRadius(20)
        .shadow(radius: 7)
    }
    
     func changeCityButtonTitle(city: String) {
        print(city)
         self.cityName = city
    }
    
    func changeDate(date: Date) {
       print(date)
        self.reservationDate = date
   }
}

struct SearchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHeaderView(reservationDate: .constant(Date()), numberOfPeople: .constant(2), cityName: .constant(""))
    }
}
