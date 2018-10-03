//
//  CategoryModel.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 03/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryModel: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var id: Int = 0
}

public func addItem(title: String, id: Int) {
    let categoryModel = CategoryModel()
    categoryModel.title = title
    categoryModel.id = id
    let realm = try! Realm()
    try! realm.write {
        realm.add(categoryModel)
    }
}
