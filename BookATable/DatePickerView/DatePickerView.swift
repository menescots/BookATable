//
//  DatePickerView.swift
//  BookATable
//
//  Created by Agata Menes on 11/04/2023.
//

import SwiftUI

struct DatePickerView: View {
        @Environment(\.dismiss) private var dismiss
        var changeDate: (Date) -> Void
        @State var date: Date
            var body: some View {
                DatePicker(
                    "Pick a date",
                    selection: $date,
                    in: Date()...,
                    displayedComponents: [.date, .hourAndMinute])
                    .padding()
                    .datePickerStyle(.graphical)
                    .accentColor(Color("DarkBlue"))
                    .onAppear {
                        UIDatePicker.appearance().minuteInterval = 15
                    }
                Spacer()
                
                VStack {
                    Button {
                        self.changeDate(date)
                        dismiss()
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "highlighter")
                                .foregroundColor(.white)
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .regular))
                        }
                        .frame(width: UIScreen.main.bounds.width - 40, height: 44)
                        .background(Color("DarkBlue"))
                        .cornerRadius(25)
                    }
                    .padding(.top, 10)
                }
                .frame(minWidth: UIScreen.main.bounds.width)
                .background(Color(.white))
                .shadow(radius: 3)
            }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(changeDate: { _ in}, date: Date())
    }
}
