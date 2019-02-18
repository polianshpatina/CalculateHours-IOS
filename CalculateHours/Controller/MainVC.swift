//
//  ViewController.swift
//  CalculateHours
//
//  Created by ccc on 15/02/2019.
//  Copyright © 2019 UFT. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.9792393718, green: 0.5680824509, blue: 0.01259920303, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        
        wageTxt.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        priceTxt.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
    }
    
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if let wageString = wageTxt.text?.currencyInputFormatting() {
            wageTxt.text = wageString
        }
        
        if let priceString = priceTxt.text?.currencyInputFormatting() {
            priceTxt.text = priceString
        }
    }

    @objc func calculate(){
        if (wageTxt.text?.isEmpty)! || (priceTxt.text?.isEmpty)! {
        self.textFieldrequired()
        }
        else{
            let wageString =  String.convertToString(param: wageTxt.text!)
            let PriceString =  String.convertToString(param: priceTxt.text!)
            
            if let wage = Double(wageString), let price = Double(PriceString) {
                view.endEditing(true)
                resultLbl.isHidden = false
                hoursLbl.isHidden = false
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            
         }
      }
   }
    
    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    // MARK: Text Field Required
    func textFieldrequired(){
        
        var errorMsg : String = ""
        
        if (self.wageTxt.text?.isEmpty)! {
            errorMsg += "Wage can not be empty"
            Alerts.ShowAlert(errorMsg, parentVC: self)
        }
            
        else if (self.priceTxt.text?.isEmpty)! {
            errorMsg += "Price can not be empty"
            Alerts.ShowAlert(errorMsg, parentVC: self)
        }
    }
    // MARK: Text Field Required
    
}

