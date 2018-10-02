//
//  ViewController.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 29/09/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UnderLineTextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        setTextField()
        textField.setRightPaddingPoints(30)
    }

    @IBAction func chooseCurrencyConversionButtonTouched(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let chooseCurrencyViewController = storyboard.instantiateViewController(withIdentifier: "ChooseCurrencyViewController") as! ChooseCurrencyViewController
        
        show(chooseCurrencyViewController, sender: nil)
    }
    
}

//textField 관련
extension ViewController {
    @IBAction func textFieldEdidtingDidBegin(_ sender: UnderLineTextField) {
        sender.underlindeColor = .red
    }
    
    @IBAction func textFieldEdidtingDidEnd(_ sender: UnderLineTextField) {
        sender.underlindeColor = .darkGray
    }
    
    @IBAction func textFieldChanged(_ sender: UnderLineTextField) {
        resultLabel.text = "\((Int(textField.text!) ?? 0) * 1111)  원"
    }
}
