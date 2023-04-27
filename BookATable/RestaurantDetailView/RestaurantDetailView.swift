//
//  RestaurantDetailView.swift
//  BookATable
//
//  Created by Agata Menes on 29/03/2023.
//

import SwiftUI

struct RestaurantDetailView: View {
    var buttonOptions = ["Menu", "Info", "Contact"]
    @State var numberOfPeople: Int
    @State var cityName: String
    @State var reservationDate: Date
    @State var restaurantName: String
    @State private var buttonState = MenuButtonState.menu
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false) {
                StickyHeader {
                    ZStack{
                            Image("thai")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(minHeight: 300)
                        
                    }
                }.frame(height: 200)
                VStack{
                    
                    VStack() {
                        Text("RAGU")
                            .foregroundColor(Color(.white))
                            .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                            .font(.custom("AvenirNext-Regular", fixedSize: 40))
                            .fontWeight(.medium)
                            .padding(.leading, 20)
                            .padding(.vertical)
                        
                        Label("Ogród botaniczny 18/3", systemImage: "mappin.and.ellipse")
                            .foregroundColor(.white)
                            .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                            .font(.custom("AvenirNext-Regular", fixedSize: 16))
                            .fontWeight(.regular)
                            .padding(.leading, 20)
                            .padding(.bottom, 5)
                        Label("Dziś otwarte 08:00 - 20:00", systemImage: "clock")
                            .foregroundColor(.white)
                            .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                            .font(.custom("AvenirNext-Regular", fixedSize: 16))
                            .fontWeight(.regular)
                            .padding(.leading, 20)
                    }
                    
                    HStack() {
                        ForEach(MenuButtonState.allCases, id: \.rawValue) { item in
                            Button {
                                buttonState = item
                            } label: {
                                Text(item.rawValue)
                                    .foregroundColor(.white)
                                    .font(.custom("AvenirNext-Regular", fixedSize: 19))
                                    .fontWeight(.regular)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal, 10)
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    
                    Divider()
                        .overlay(.white)
                    
                    
                    switch buttonState {
                    case .menu:
                        MenuView()
                    case .info:
                        InfoView()
                    case .contact:
                        ContactView()
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                .frame(minHeight: UIScreen.main.bounds.height - 300)
                
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("DarkBlue").opacity(10), Color("LightViolet").opacity(11)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .clipShape(CustomShape()))
            }
            VStack {
                    NavigationLink() {
                        ReservationMakingView(numberOfPeople: numberOfPeople, cityName: cityName, reservationDate: reservationDate, restaurantName: restaurantName)
                    } label: {
                    HStack(alignment: .center) {
                        Image(systemName: "highlighter")
                            .foregroundColor(.white)
                        Text("Make reservation")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .regular))
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 44)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("DarkBlue").opacity(10), Color("LightViolet").opacity(11)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(25)
                }
            }
            .frame(minWidth: UIScreen.main.bounds.width)
            .background(Color(.white))
                
        }
        }
    
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(numberOfPeople: 2, cityName: "", reservationDate: Date(), restaurantName: "")
    }
}

struct StickyHeader<Content: View>: View {

    var minHeight: CGFloat
    var content: Content
    
    init(minHeight: CGFloat = 300, @ViewBuilder content: () -> Content) {
        self.minHeight = minHeight
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            if(geo.frame(in: .global).minY <= 0) {
                content
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            } else {
                content
                    .offset(y: -geo.frame(in: .global).minY)
                    .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
            }
        }.frame(minHeight: minHeight)
    }
}
