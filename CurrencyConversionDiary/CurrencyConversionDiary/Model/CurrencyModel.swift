//
//  CurrencyModel.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 03/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import Foundation
import RealmSwift

class CurrencyModel: Object {
    @objc dynamic var countryName : String = ""
    @objc dynamic var id : Int = 0
    @objc dynamic var currencyName: String = ""
    @objc dynamic var nowCurrency: Double = 0
    @objc dynamic var saveDate: Date!
}

public func addItem(countryName: String, id: Int, currencyName: String, nowCurrency: Double, saveDate: Date) {
    let currencyModel = CurrencyModel()
    currencyModel.countryName = countryName
    currencyModel.id = id
    currencyModel.currencyName = currencyName
    currencyModel.nowCurrency = nowCurrency
    currencyModel.saveDate = saveDate
    let realm = try! Realm()
    try! realm.write {
        realm.add(currencyModel)
    }
}
