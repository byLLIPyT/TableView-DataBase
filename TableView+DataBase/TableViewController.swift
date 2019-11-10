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
        
        
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwindSeque(_ seque: UIStoryboardSegue) {
        
        guard let newCarVC = seque.source as? AddCarViewController else { return }

        newCarVC.addNewCar()
    }
}
