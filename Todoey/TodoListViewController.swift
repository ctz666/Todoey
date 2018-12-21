//
//  ViewController.swift
//  Todoey
//
//  Created by Tiezhong Chen on 2018-12-18.
//  Copyright © 2018 Tiezhong Chen. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    let itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    
    
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
    
    
    
}

