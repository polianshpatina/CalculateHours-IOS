//
//  CurrencyInputFormat.swift
//  CalculateHours
//
//  Created by ccc on 18/02/2019.
//  Copyright © 2019 UFT. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    // formatting text for currency textField
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencySymbol = "$"
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
    
     static func convertToString(param : String) -> String {
        
        let template = param
        let indexStartOfText = template.index((template.startIndex), offsetBy: 1)
        let shumaSubstring = template[indexStartOfText...]
        let newString = String(shumaSubstring)
        let ShumaString = newString.replacingOccurrences(of: ",", with: "")
        return ShumaString
    }
    
}
