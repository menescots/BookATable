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
            formatter.dateFormat = "dd.MM"
            return formatter
        }()
    
   

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
                    Text("Reservation detail")
                        .foregroundColor(Color(.white))
                        .frame(minWidth: UIScreen.main.bounds.width, alignment: .center)
                        .font(.custom("AvenirNext-Regular", fixedSize: 26))
                        .fontWeight(.semibold)
                        .padding(.top, 15)
                    
                    Divider()
                        .overlay(.white)
                    VStack {
                        Text("Date")
                            .font(.system(size: 23, weight: .light, design: .default))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(.leading, 20)
                        HStack {
                            Button {
                                reservationDate = Calendar.current.date(byAdding: .day, value: -1, to: reservationDate) ?? Date()
                            } label: {
                                HStack {
                                    Label("Previous", systemImage: "arrow.backward")
                                        .foregroundColor(.white)
                                }
                            }
                            NavigationLink {
                                DatePickerView(changeDate: self.changeDate(date: ), date: reservationDate)
                            } label: {
                                Label("\(reservationDate, formatter: dateFormatter)", systemImage: "calendar")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame( height: 40)
                            }
                            .background(.white)
                            .cornerRadius(14)
                            .padding(.horizontal)
                            
                            Button {
                                reservationDate = Calendar.current.date(byAdding: .day, value: 1, to: reservationDate) ?? Date()
                            } label: {
                                HStack {
                                    Text("Next")
                                    Image(systemName: "arrow.forward")
                                }
                                .foregroundColor(.white)
                            }
                        }
                    }.padding(.bottom)
                    Divider()
                        .overlay(.white)
                   
                    //Number of people
                    VStack {
                        Text("Number of people")
                            .font(.system(size: 23, weight: .light, design: .default))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(.leading, 20)
                        
                        
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(1..<26) { number in
                                        Button {
                                            print(number)
                                        } label: {
                                            Text("\(number)")
                                                .padding(5)
                                                .foregroundColor(.black)
                                        }
                                        .frame(width: 40, height: 40)
                                        .background(.white)
                                        .cornerRadius(14)
                                    }
                                }
                            }.padding(.leading, 20)
                        }.padding(.bottom)
                    
                    Divider()
                        .overlay(.white)
                    Spacer()
                }
                .frame(minHeight: UIScreen.main.bounds.height - 300)
                .frame(width: UIScreen.main.bounds.width)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("DarkBlue").opacity(10), Color("LightViolet").opacity(20)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .clipShape(CustomShape()))
            }
            VStack {
                NavigationLink() {
                    
                } label: {
                    HStack(alignment: .center) {
                        Image(systemName: "highlighter")
                            .foregroundColor(.white)
                        Text("Confirm")
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

struct ReservationMakingView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationMakingView(numberOfPeople: 2, cityName: "", reservationDate: Date(), restaurantName: "")
    }
}
