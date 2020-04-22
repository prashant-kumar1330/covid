//
//  HomeView.swift
//  Covid
//
//  Created by Deepanshu Yadav on 22/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import SwiftUI

struct HomeView: View{
    @ObservedObject var data = FetchData()
    
    var body : some View{
        VStack{
            if self.data.countries.count != 0 && self.data.data != nil {
                VStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading, spacing: 15){
                            Text(getDate(time: self.data.data!.updated))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text("COVID 19 Cases")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text(getValue(data: self.data.data.cases))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {
                            self.data.data = nil
                            self.data.countries.removeAll()
                            self.data.updateData()
                        }) {
                            Image(systemName: "arrow.clockwise")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)!+18)
                    .padding()
                    .padding(.bottom,80)
                    .background(Color.red)
                    
                    HStack(spacing: 15){
                        VStack(alignment: .leading, spacing: 15){
                            Text("Deaths")
                                .foregroundColor(Color.black.opacity(0.5))
                            Text(getValue(data: self.data.data.deaths))
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                            .padding(30)
                            .background(Color.white)
                            .cornerRadius(15)
                        VStack(alignment: .leading, spacing: 15){
                            Text("Recovered")
                                .foregroundColor(Color.black.opacity(0.5))
                            Text(getValue(data: self.data.data.recovered))
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                            .padding(30)
                            .background(Color.white)
                            .cornerRadius(15)
                    }
                    .offset(y: -60)
                    .padding(.bottom,-60)
                    .zIndex(25)
                    VStack(alignment: .center, spacing: 15){
                        Text("Active")
                            .foregroundColor(Color.black.opacity(0.5))
                        Text(getValue(data: self.data.data.active))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                    }
                        .padding(30)
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.top,15)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing:15){
                            ForEach(self.data.countries, id: \.self){i in
                                CellView(data: i)
                            }
                        }.padding()
                    }
                }
                    
            } else {
                GeometryReader{_ in
                    VStack{
                        Indicator()
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
        
    }
    
}
func getDate(time: Double)->String{
    let date = Double(time/1000)
    let format = DateFormatter()
    format.dateFormat = "MMM - dd - YYYY hh:mm a"
    return format.string(from: Date(timeIntervalSinceNow: TimeInterval(exactly: date)!))
}
func getValue(data: Double)->String{
    let format = NumberFormatter()
    format.numberStyle = .decimal
    return format.string(for: data)!
}
struct Indicator : UIViewRepresentable{
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.startAnimating()
        return indicatorView
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
    }
}
