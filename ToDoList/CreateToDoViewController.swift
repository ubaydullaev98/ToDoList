//
//  CreateToDoViewController.swift
//  ToDoList
//
//  Created by Dilmurod Ubaydullaev on 12/26/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {
    
    var toDoTableVC : ToDoListTableViewController? = nil

    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if let name = toDoTextField.text{
            let toDo = ToDo(name: name, important: importantSwitch.isOn)
            toDoTableVC?.toDos.append(toDo)
            toDoTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}
