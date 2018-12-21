//
//  ViewController.swift
//  Todoey
//
//  Created by Tiezhong Chen on 2018-12-18.
//  Copyright © 2018 Tiezhong Chen. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]  //variable, because we will add more to the list
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    //MARK: (1) TableviewDatasource Methods, two methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count      //number of Rows = Array counts
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create a reuseable cell, identifier = "ToDoItemCell" (the identifier we gave to prototype cell)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        //populate the cell using the Array content
        cell.textLabel?.text = itemArray[indexPath.row]
        
        //return to the tableView and displayed as a row
        return cell
    }
    
    //MARK: (2) TableView Delegate Methods
    
    //when the Row is selected, do something
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    print(indexPath.row)          //print in the console when a cell is selected, and the number of that cell will show
    //   print(itemArray[indexPath.row]) //print in the console when a cell is selected, show the item name in the Array
        
        tableView.deselectRow(at: indexPath, animated: true)   //flash grey when selected, and then it deselect it and back to normal white
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
              tableView.cellForRow(at: indexPath)?.accessoryType = .none    //if there's checkmark in the cell, then remove the checkmark when click
        }else {
              tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark   //if not, add a checkmark (accessory) when the cell is selected
        }
        
    }
    
    //MARK: (3) Add new Items, the button (Bar button Item), change "system item" property to add. 
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()  //this variable is accessible to all the functions below, whether inside the closure or not.
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert) //create an alert named "Add New Todoey Item"
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in   //this is completion handler (closure)
            //What will happen once the user clicks the Add Item button on our UIAlert
            self.itemArray.append(textField.text!)  //add the new item as in the textField to the itemArray.
            //inside closure, add "self.", Force unwrap the text, because there must be some text in the textfield, even if user doesn't type anything, it will be an empty string.
            
            self.tableView.reloadData()    //We have to reload the tableView to show the new data added to the cell, otherwise it will not update the View, but only update the Array behinds the scene. 
        }
        
        alert.addTextField { (alertTextField) in     //this is another closure, when alert shows up, it will offer a textfield for you to enter
            alertTextField.placeholder = "Create new item"   //this is a placeholder in grey, give you hints about what should be in the textfield, as soon as we start typing in the textfield, the placeholder will disappear.
            textField = alertTextField  //set the value of the textField to what alertTextField written
        }
        alert.addAction(action)  //add action to the alert, action is "Add Item", it will show thie action option when alert "Add New Todoey Item" pups.
        
        present(alert, animated:true, completion: nil)    //When button pressed show the alert
    }
    
}

