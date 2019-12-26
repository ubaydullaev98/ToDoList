//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Dilmurod Ubaydullaev on 12/26/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    //var toDos : [ToDo] = []
    var toDos = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDo1 = ToDo(name: "Walk the Dog", important: false)
        let toDo2 = ToDo(name: "Buy Milk", important: true)
        toDos = [toDo1,toDo2]
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = toDos[indexPath.row].name
        return cell
    }
    
    
}
