//
//  CountryDetails.swift
//  Covid
//
//  Created by Deepanshu Yadav on 22/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import Foundation

struct CountryDetail: Decodable,Hashable{
    var country: String
    var cases: Double
    var deaths: Double
    var todayCases: Double
    var active: Double
    var recovered: Double
    var critical: Double
}
