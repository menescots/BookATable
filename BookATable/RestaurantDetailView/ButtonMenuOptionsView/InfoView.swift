//
//  InfoView.swift
//  BookATable
//
//  Created by Agata Menes on 05/04/2023.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Restauracja")
                .foregroundColor(.white)
                .font(.custom("AvenirNext-Regular", fixedSize: 22))
                .fontWeight(.medium)
                .padding(.bottom, 5)
            
            VStack(alignment: .leading) {
                Text("Kuchnia i dania")
                    .foregroundColor(.white)
                    .font(.custom("AvenirNext-Regular", fixedSize: 15))
                    .fontWeight(.regular)
                    .padding(.bottom, 5)
                
                HStack {
                    Image(systemName: "fork.knife")
                        .foregroundColor(.white)
                    Text("europejska, włoska, dobra mniam")
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Regular", fixedSize: 17))
                        .fontWeight(.regular)
                }
                Divider()
                    .overlay(.white)
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                Text("Atmosfera")
                    .foregroundColor(.white)
                    .font(.custom("AvenirNext-Regular", fixedSize: 15))
                    .fontWeight(.regular)
                    .padding(.bottom, 5)
                
                HStack {
                    Image(systemName: "person.3.fill")
                        .foregroundColor(.white)
                        .foregroundColor(.white)
                    Text("casual, przytulna")
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Regular", fixedSize: 17))
                        .fontWeight(.regular)
                }
                Divider()
                    .overlay(.white)
            }
            VStack(alignment: .leading) {
                Text("Średnia cena")
                    .foregroundColor(.white)
                    .font(.custom("AvenirNext-Regular", fixedSize: 15))
                    .fontWeight(.regular)
                    .padding(.bottom, 5)
                
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.white)
                    Text("60 - 90 zł")
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Regular", fixedSize: 17))
                        .fontWeight(.regular)
                }
                Divider()
                    .overlay(.white)
            }
        }.padding(.horizontal)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
