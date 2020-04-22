//
//  FetchData.swift
//  Covid
//
//  Created by Deepanshu Yadav on 22/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import Foundation

var countryList = ["india","usa","italy","china","spain"]
class FetchData: ObservableObject{
    @Published var data: Case!
    @Published var countries = [CountryDetail]()
    
    init(){
        updateData()
    }
    func updateData(){
        let url="https://corona.lmao.ninja/v2/all"
        let countryDataUrl = "https://corona.lmao.ninja/v2/countries/"
        
        let session = URLSession(configuration: .default)
        let sessionCountry = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, response, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSONDecoder().decode(Case.self, from: data!)
            DispatchQueue.main.async {
                self.data = json
            }
        }.resume()
        for i in countryList{
            sessionCountry.dataTask(with: URL(string: countryDataUrl+i)!) { (data, response, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                let json = try! JSONDecoder().decode(CountryDetail.self, from: data!)
                DispatchQueue.main.async {
                    self.countries.append(json)
                }
            }.resume()

        }
    }
}

