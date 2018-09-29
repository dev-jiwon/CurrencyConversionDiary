//
//  UnderLineTextField.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 29/09/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import UIKit

@IBDesignable
class UnderLineTextField: UITextField, UITextFieldDelegate {
    
    var underlineLayer: CALayer?
    @IBInspectable var underlindeColor: UIColor {
        get { return UIColor(cgColor: underlineLayer?.borderColor ?? UIColor.lightGray.cgColor) }
        set {
            let underlineLayer = CALayer()
            underlineLayer.borderWidth = 1
            underlineLayer.borderColor = newValue.cgColor
            underlineLayer.frame = CGRect(x: 0, y: frame.height + 10, width: frame.width, height: 1)
            self.underlineLayer = underlineLayer
            layer.addSublayer(underlineLayer)
        }
    }
    
    @IBAction func textFieldDidBeginEditing(_ textField: UITextField) {
        print("hi")
        underlindeColor = .red
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("nobi")
    }

}
