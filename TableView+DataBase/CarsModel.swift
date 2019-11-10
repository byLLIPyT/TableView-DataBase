//
//  CarsModel.swift
//  TableView+DataBase
//
//  Created by Александр Уткин on 10/11/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import RealmSwift

struct carsDefault {
    var brand: String?
    var model: String?
    var type: String?
    var year: String?
    var classCar: String?
}

class Car: Object {
    @objc dynamic var brand: String?
    @objc dynamic var model: String?
    @objc dynamic var type: String?
    @objc dynamic var year: String?
    @objc dynamic var classCar: String?
    
    
    convenience init(brand: String?, model: String?, type: String?, year: String?, classCar: String?) {
        self.init()
        
        self.brand = brand
        self.model = model
        self.type = type
        self.year = year
        self.classCar = classCar
    }
    
    var carsDef = [
        carsDefault(brand: "BMW", model: "3", type: "sedan", year: "2018", classCar: "C-class"),
        carsDefault(brand: "Toyota", model: "Camry", type: "sedan", year: "2015", classCar: "E-class"),
        carsDefault(brand: "Mersedes", model: "S-class", type: "sedan", year: "2019", classCar: "S-class")
    ]
    
    func saveCarDefault() {
        for car in carsDef {
            
            let newCar = Car()
            
            newCar.brand = car.brand
            newCar.model = car.model
            newCar.type = car.type
            newCar.year = car.year
            newCar.classCar = car.classCar
            
            StorageManager.saveObject(newCar)
        }
    }
}
