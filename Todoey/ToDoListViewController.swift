//
//  ViewController.swift
//  Todoey
//
//  Created by Hanisa Mohamed on 3/7/19.
//  Copyright © 2019 Hanisa Mohamed. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["Find", "Buy", "Destroy"]
    
    var defaults = UserDefaults.standard
    
   //var defaultcheckmarkmemory = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
        
    //    if let check = defaultcheckmarkmemory.value(forKey: "CheckmarkOrNot") {
     //       tableView.cellForRow(at: IndexPath)?.accessoryType = check
       // }
    }
    
//MARK - Tableview Datasource Methods
    
    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // Configure the cell’s contents.
        cell.textLabel!.text = itemArray[indexPath.row]
        
        return cell
    }
    
//MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        // creates a checkmark when pressed
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //defaultcheckmarkmemory.set(tableView.cellForRow(at: indexPath)?.accessoryType , forKey: "CheckmarkOrNot")
        
        // animates the button pressed
        tableView.deselectRow(at: indexPath, animated: true)
    }

//MARK - Add new Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfielditem = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (alertAction) in
            //What happens when the user presses "add item" on UI Alert
            self.itemArray.append(textfielditem.text!)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textfielditem = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

    
    
}

