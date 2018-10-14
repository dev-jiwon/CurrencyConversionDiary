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
    var currencyNow = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        setTextField()
        textField.setRightPaddingPoints(30)
        setDefault()
    }
    
    func setDefault() {
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived(notification:)), name: Notification.Name("getCurrencyNoti"), object: nil)
        if UserDefaults.standard.object(forKey: "currency") == nil {
            UserDefaults.standard.set("USD", forKey: "currency") //저장
        }
        CurrencyExchangeCenter().getCurrency()
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
        print(currencyNow)
        resultLabel.text = "\(String(format: "%.2f", (Double(textField.text!) ?? 0) * currencyNow))  원"
    }
}

//notification 관련
extension ViewController {
    @objc func notificationReceived(notification: Notification) {
        guard let notificationUserInfo = notification.userInfo as? [String: Double],
            let currencyResult = notificationUserInfo["currency"] else { return }
        currencyNow = currencyResult
        resultLabel.text = "\(String(format: "%.2f", (Double(textField.text!) ?? 0) * currencyNow))  원"
        
        print("aaaa\(currencyNow)")
    }
}
