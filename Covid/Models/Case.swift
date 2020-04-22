//
//  Case.swift
//  Covid
//
//  Created by Deepanshu Yadav on 22/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import Foundation

struct Case: Decodable{
    var cases: Double
    var deaths: Double
    var todayCases: Double
    var updated: Double
    var active: Double
    var recovered: Double
    var critical: Double
}


