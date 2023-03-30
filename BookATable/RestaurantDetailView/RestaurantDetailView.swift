//
//  RestaurantDetailView.swift
//  BookATable
//
//  Created by Agata Menes on 29/03/2023.
//

import SwiftUI

struct RestaurantDetailView: View {
    var buttonOptions = ["Menu", "Info", "Contact"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            StickyHeader {
                ZStack{
                        Image("thai")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minHeight: 240)
                    
                }
            }
            VStack{
                Capsule()
                    .foregroundColor(Color(.systemGray4))
                    .frame(width: 48, height: 6)
                    .padding(.top, 5)
                
                VStack() {
                    Text("RAGU")
                        .foregroundColor(.white)
                        .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                        .font(.custom("AvenirNext-Regular", fixedSize: 40))
                        .fontWeight(.regular)
                        .padding(.leading, 20)
                    
                    Label("Ogród botaniczny 18/3", systemImage: "mappin.and.ellipse")
                        .foregroundColor(.white)
                        .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                        .font(.custom("AvenirNext-Regular", fixedSize: 18))
                        .fontWeight(.regular)
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                    Label("Dziś otwarte 08:00 - 20:00", systemImage: "clock")
                        .foregroundColor(.white)
                        .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                        .font(.custom("AvenirNext-Regular", fixedSize: 18))
                        .fontWeight(.regular)
                        .padding(.leading, 20)
                }
                
                HStack() {
                    ForEach(buttonOptions, id: \.self) { item in
                        Button {
                            
                        } label: {
                            Text(item)
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
                Spacer()
            }
            .frame(minHeight: UIScreen.main.bounds.height - 200)
            .background(Color("DarkBlue"))
            .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
            
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView()
    }
}

struct StickyHeader<Content: View>: View {

    var minHeight: CGFloat
    var content: Content
    
    init(minHeight: CGFloat = 200, @ViewBuilder content: () -> Content) {
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
