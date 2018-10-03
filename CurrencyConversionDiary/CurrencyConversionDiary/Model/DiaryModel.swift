//
//  DiaryModel.swift
//  CurrencyConversionDiary
//
//  Created by Na jiwon on 03/10/2018.
//  Copyright © 2018 Na jiwon. All rights reserved.
//

import Foundation
import RealmSwift

class DiaryModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var saveDate: Date = Date()
}

public func addItem(id: Int, title: String, content: String, category: String) {
    let diaryModel = DiaryModel()
    diaryModel.id = id
    diaryModel.title = title
    diaryModel.content = content
    diaryModel.category = category
    let realm = try! Realm()
    try! realm.write {
        realm.add(diaryModel)
    }
}



