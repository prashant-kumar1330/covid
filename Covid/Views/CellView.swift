//
//  CellView.swift
//  Covid
//
//  Created by Deepanshu Yadav on 22/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import SwiftUI

struct CellView: View{
    var data: CountryDetail
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Text(data.country)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
            HStack(spacing: 15){
                VStack(alignment: .leading, spacing: 12){
                    Text("Active Cases")
                        .font(.title)
                        .foregroundColor(.black)
                    Text(getValue(data: data.active))
                        .font(.title)
                        .foregroundColor(.black)
                }
                VStack(alignment: .leading, spacing: 12){
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Deaths")
                            .foregroundColor(.black)
                        Text(getValue(data: data.deaths))
                            .foregroundColor(.red)
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recovered")
                            .foregroundColor(.black)
                        Text(getValue(data: data.recovered))
                            .foregroundColor(.green)
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Critical")
                            .foregroundColor(.black)
                        Text(getValue(data: data.critical))
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width-30)
        .background(Color.white)
        .cornerRadius(25)
    }
    
}

