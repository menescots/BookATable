//
//  CustomTextField.swift
//  BookATable
//
//  Created by Agata Menes on 01/06/2023.
//

import SwiftUI

struct CustomTextField: View {
    @State var titleKey: String
    @State var text: String
    var body: some View {
        TextField(titleKey, text: $text)
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .clipShape(Capsule())
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius:10.0).strokeBorder(Color("DarkBlue"), style: StrokeStyle(lineWidth: 1.0)))
        .frame(width: UIScreen.main.bounds.width - 70, height: 44)
        .padding(.vertical, 5)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(titleKey: "", text: "")
    }
}
