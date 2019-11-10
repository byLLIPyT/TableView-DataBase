//
//  RealmManager.swift
//  TableView+DataBase
//
//  Created by Александр Уткин on 10/11/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import RealmSwift

let realm = try? Realm()

class StorageManager {
    
    static func saveObject(_ car: Car) {
        try? realm?.write {
            realm?.add(car)
        }
    }
    
}
