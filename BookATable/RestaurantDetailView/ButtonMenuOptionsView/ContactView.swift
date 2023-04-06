//
//  ContactView.swift
//  BookATable
//
//  Created by Agata Menes on 05/04/2023.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                HStack() {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.white)
                    
                    Text("Zobacz na mapie")
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Regular", fixedSize: 19))
                        .fontWeight(.regular)
                        .padding(.horizontal, 10)
                }
            }

            Divider()
                .overlay(.white)
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.white)
                    
                    Text("72 923 839")
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Regular", fixedSize: 19))
                        .fontWeight(.regular)
                        .padding(.horizontal, 10)
                }
                
            }
            Divider()
                .overlay(.white)
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "message")
                        .foregroundColor(.white)
                    
                    Text("Zobacz na facebooku")
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Regular", fixedSize: 19))
                        .fontWeight(.regular)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
