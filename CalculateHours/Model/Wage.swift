//
//  Wage.swift
//  CalculateHours
//
//  Created by ccc on 18/02/2019.
//  Copyright © 2019 UFT. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage)) 
    }
}
