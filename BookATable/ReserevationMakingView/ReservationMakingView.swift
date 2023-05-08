//
//  ReservationMakingView.swift
//  BookATable
//
//  Created by Agata Menes on 13/04/2023.
//

import SwiftUI

struct ReservationMakingView: View {
    @State var numberOfPeople: Int
    @State var cityName: String
    @State var reservationDate: Date
    @State var restaurantName: String
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM hh:mm"
            return formatter
        }()
    var reservationTime = ["1 hour", "1.5 hours", "2 hours", "2.5 hours", "3 hours", "3.5 hours", "4 hours"]
    @State public var reservationTimeSelected = "1 hour"
    @State private var buttonState = ReservationState.detail
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false) {
                //image
                StickyHeader {
                    ZStack(alignment: .leading){
                        Image("thai")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minHeight: 200)
                            .blur(radius: 10)
                    }
                }.frame(height: 50)
                VStack{
                    Text("Reservation")
                        .foregroundColor(Color("DarkBlue"))
                        .frame(minWidth: UIScreen.main.bounds.width, alignment: .center)
                        .font(.custom("AvenirNext-Regular", fixedSize: 26))
                        .fontWeight(.semibold)
                        .padding(.top, 15)
                    
                    Color("DarkBlue").frame(width: UIScreen.main.bounds.width, height: 1.5)
                    
                    HStack() {
                        ForEach(ReservationState.allCases, id: \.rawValue) { item in
                            Button {
                                buttonState = item
                            } label: {
                                VStack{
                                    Text(item.rawValue)
                                        .foregroundColor(Color("DarkBlue"))
                                        .font(.custom("AvenirNext-Regular", fixedSize: 22))
                                        .fontWeight(self.buttonState == item ? .semibold : .regular)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal, 10)
                                    
                                    }
                                }
                                
                            Color("DarkBlue").frame(width: 1.5 / UIScreen.main.scale, height: 20)
                        }
                    }
                    .padding(.vertical, 10)
                    
                    Color("DarkBlue").frame(width: UIScreen.main.bounds.width, height: 1.5)
                    switch buttonState {
                    case .detail:
                        VStack {
                            Text("Date and time")
                                .font(.system(size: 22, weight: .light, design: .default))
                                .foregroundColor(Color("DarkBlue"))
                                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                                .padding(.leading, 20)
                            HStack {
                                Button {
                                    reservationDate = Calendar.current.date(byAdding: .day, value: -1, to: reservationDate) ?? Date()
                                } label: {
                                    HStack {
                                        Label("Previous", systemImage: "arrow.backward")
                                            .foregroundColor(Color("DarkBlue"))
                                    }
                                }
                                NavigationLink {
                                    DatePickerView(changeDate: self.changeDate(date: ), date: reservationDate)
                                } label: {
                                    Label("\(reservationDate, formatter: dateFormatter)", systemImage: "calendar")
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame( height: 40)
                                }
                                .background(Color("DarkBlue"))
                                .cornerRadius(14)
                                .padding(.horizontal)
                                
                                Button {
                                    reservationDate = Calendar.current.date(byAdding: .day, value: 1, to: reservationDate) ?? Date()
                                } label: {
                                    HStack {
                                        Text("Next")
                                            .foregroundColor(Color("DarkBlue"))
                                        Image(systemName: "arrow.forward")
                                            .foregroundColor(Color("DarkBlue"))
                                    }
                                    .foregroundColor(.white)
                                }
                            }
                        }.padding(.bottom)
                        Divider()
                            .overlay(Color("DarkBlue"))
                       
                        //Number of people
                        VStack {
                            Text("Number of people")
                                .font(.system(size: 22, weight: .light, design: .default))
                                .foregroundColor(Color("DarkBlue"))
                                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                                .padding(.leading, 20)
                            
                            
                            ScrollViewReader { proxy in
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 15) {
                                            numberOfPeopleButtons(selection: $numberOfPeople)
                                                
                                            
                                            
                                        }
                                    }.padding(.leading, 20)
                                }
                            }.padding(.bottom)
                        
                        Divider()
                            .overlay(Color("DarkBlue"))
                        
                        VStack {
                            Text("Reservation time")
                                .font(.system(size: 22, weight: .light, design: .default))
                                .foregroundColor(Color("DarkBlue"))
                                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                                .padding(.leading, 20)
                            
                            
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(reservationTime, id: \.self) { resTime in
                                            Button(action: {
                                                self.reservationTimeSelected = resTime
                                            }, label: {
                                                Text(resTime)
                                                    .padding()
                                            })
                                            .foregroundColor(self.reservationTimeSelected == resTime ? .white :  Color("DarkBlue"))
                                                .frame(height: 40)
                                                .background(self.reservationTimeSelected == resTime ? Color("DarkBlue") : .white)
                                                .cornerRadius(14)
                                        }
                                    }
                                }.padding(.leading, 20)
                            }.padding(.bottom)
                    case .summary:
                        ReservationSummary()
                    }
                    Spacer()
                }
                .frame(minHeight: UIScreen.main.bounds.height - 300)
                .frame(width: UIScreen.main.bounds.width)
                .background(.white)
                .clipShape(CustomShape())
            }
            VStack {
                Button {
                    buttonState = .summary
                } label: {
                    HStack(alignment: .center) {
                        Text(self.buttonState == .detail ? "Next" : "Make reservation")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .regular))
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 44)
                    .background(Color("DarkBlue"))
                    .cornerRadius(25)
                }
                .padding(.top, 10)
            }
            .frame(minWidth: UIScreen.main.bounds.width)
            .background(Color(.white))
        }
    }
    func changeDate(date: Date) {
       self.reservationDate = date
   }
}

struct numberOfPeopleButton: View {
    let id: Int
    @Binding var currentlySelectedNumber: Int
    let title: Int
    var body: some View {
        Button(action: {
            print(currentlySelectedNumber)
            self.currentlySelectedNumber = self.id
        }, label: { Text("\(title)") })
            .foregroundColor(id == currentlySelectedNumber ? .white : .black)
            .frame(width: 40, height: 40)
            .background(id == currentlySelectedNumber ? Color("DarkBlue") : .white)
            .cornerRadius(14)
    }
}

struct numberOfPeopleButtons: View {
    init(selection: Binding<Int>) {
        self._currentlySelectedNumber = selection
    }
    @Binding var currentlySelectedNumber: Int
    var body: some View {
        HStack {
            ForEach(1..<26) { number in
                numberOfPeopleButton(id: number, currentlySelectedNumber: $currentlySelectedNumber, title: number)
                    .id(number)
            }
        }
    }
}
struct ReservationMakingView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationMakingView(numberOfPeople: 2, cityName: "", reservationDate: Date(), restaurantName: "")
    }
}
