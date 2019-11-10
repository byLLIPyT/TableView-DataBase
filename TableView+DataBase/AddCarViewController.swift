//
//  AddCarViewController.swift
//  TableView+DataBase
//
//  Created by Александр Уткин on 10/11/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit

class AddCarViewController: UITableViewController {

    var newCar = Car()
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var brandText: UITextField!
    @IBOutlet var modelText: UITextField!
    @IBOutlet var typeText: UITextField!
    @IBOutlet var classText: UITextField!
    @IBOutlet var yearText: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isCreate {
            DispatchQueue.main.async {
                self.newCar.saveCarDefault()
            }
        }
        
        tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            view.endEditing(true)       
    }
    
    
    func addNewCar() {
        //newCar = Cars(brand: brandText.text, model: modelText.text, type: typeText.text, year: yearText.text, classCar: classText.text)
    }
   
    @IBAction func cancekAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddCarViewController: UITextFieldDelegate {
    
    //скрыть клавиатуру
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
