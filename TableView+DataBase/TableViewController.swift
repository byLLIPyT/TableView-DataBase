//
//  TableViewController.swift
//  TableView+DataBase
//
//  Created by Александр Уткин on 10/11/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var cars: Results<Car>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars = realm?.objects(Car.self)
        if cars.isEmpty {
            let defCar = Car()
            defCar.saveCarDefault()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cars.isEmpty ? 0: cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.brandLabel.text = cars[indexPath.row].brand
        cell.typeLabel.text = cars[indexPath.row].type
        cell.yearLabel.text = cars[indexPath.row].year
        cell.modelLabel.text = cars[indexPath.row].model
        cell.classLabel.text = cars[indexPath.row].classCar
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
            let car = self.cars[indexPath.row]
            StorageManager.deleteObject(car)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])

        return swipeActions
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let car = cars[indexPath.row]
            let addCarVC = segue.destination as! AddCarViewController
            addCarVC.currentCar = car
            
        }
    }
    @IBAction func unwindSeque(_ seque: UIStoryboardSegue) {
        
        guard let newCarVC = seque.source as? AddCarViewController else { return }
        
        newCarVC.addNewCar()
        tableView.reloadData()
    }
}
