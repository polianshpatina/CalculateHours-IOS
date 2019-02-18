//
//  Alerts.swift
//  CalculateHours
//
//  Created by ccc on 18/02/2019.
//  Copyright © 2019 UFT. All rights reserved.
//

import Foundation
import UIKit

class Alerts
{
    fileprivate static var alertController : UIAlertController?
    
    static var AlertController : UIAlertController
    {
        get { return alertController! }
        set { alertController = newValue }
    }
    
    static func ShowAlert(_ msg : String, parentVC : UIViewController)
    {
        alertController = UIAlertController(title: "Warning!", message: msg, preferredStyle: .alert)
        
        alertController?.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        parentVC.present(alertController!, animated: true, completion: nil)
    }
    
}
