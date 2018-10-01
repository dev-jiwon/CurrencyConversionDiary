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
            underlineLayer.frame = CGRect(x: 0, y: self.frame.height + 10, width: self.frame.width, height: 1)
            self.underlineLayer = underlineLayer
            layer.addSublayer(underlineLayer)
        }
    }
    
    //아래 두 함수는 UnderLineTextField를 사용할때 간편하게 좌/우 여백을 주기 위한 함수
    
    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) { //오른쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
        
}
