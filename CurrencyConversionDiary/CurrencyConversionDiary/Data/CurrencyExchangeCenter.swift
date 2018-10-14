//
//  CurrencyExchangeCenter.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 14/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class CurrencyExchangeCenter {
    let url = "https://free.currencyconverterapi.com/api/v6/convert"
    let myParam = "\(UserDefaults.standard.string(forKey: "currency")!)_KRW"
    var resultValue: Double = 0
    open func getCurrency() {
        let param: Parameters = [
            "q" : myParam,
            "compact" : "ultra"
        ]
        print(param)
        
        Alamofire
            .request(url, method: .get, parameters: param)
            .validate(statusCode: 200..<400)
            .responseJSON(completionHandler: { (response) in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
//                    print("aaaa\(json[self.myParam])")
                    self.resultValue = json[self.myParam].doubleValue
                    NotificationCenter.default.post(name: Notification.Name("getCurrencyNoti"), object: nil, userInfo: ["currency": self.resultValue])
                case .failure(let error):
                    let json = JSON(error)
                    print(json.dictionaryValue)
                    print(error)
                }
            })
    }
}

