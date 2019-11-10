//
//  AddCarViewController.swift
//  TableView+DataBase
//
//  Created by Александр Уткин on 10/11/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit

class AddCarViewController: UITableViewController {
    
    var currentCar: Car?
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var brandText: UITextField!
    @IBOutlet var modelText: UITextField!
    @IBOutlet var typeText: UITextField!
    @IBOutlet var classText: UITextField!
    @IBOutlet var yearText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        setupEditScreen()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        view.endEditing(true)
    }
    
    
    func addNewCar() {
        
        let newCar = Car(brand: brandText.text,
                         model: modelText.text,
                         type: typeText.text,
                         year: yearText.text,
                         classCar: classText.text)
        if currentCar != nil {
            try? realm?.write {
                currentCar?.brand = newCar.brand
                currentCar?.model = newCar.model
                currentCar?.type = newCar.type
                currentCar?.year = newCar.year
                currentCar?.classCar = newCar.classCar
            }
        } else {
        StorageManager.saveObject(newCar)
        }
    }
    
    @IBAction func cancekAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupEditScreen() {
        if currentCar != nil {
            setupNavigationBar()
            modelText.text = currentCar?.model
            brandText.text = currentCar?.brand
            classText.text = currentCar?.classCar
            yearText.text = currentCar?.year
            typeText.text = currentCar?.type
                        
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = nil
        title = currentCar?.model
    }
    
}

extension AddCarViewController: UITextFieldDelegate {
    
    //скрыть клавиатуру
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
