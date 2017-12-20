//
//  ViewController.swift
//  To Do List
//
//  Created by Andreas Velounias on 20/12/2017.
//  Copyright © 2017 Andreas Velounias. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemAray = ["Buy Milk", "Take Dog for Walk", "Destroy Universe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Add Table View Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemAray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemAray.count
    }
    
    //MARK - Delegate Methods for TableView
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType == .none
        }
        
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

