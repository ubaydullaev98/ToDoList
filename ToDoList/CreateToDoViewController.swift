//
//  CreateToDoViewController.swift
//  ToDoList
//
//  Created by Dilmurod Ubaydullaev on 12/26/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import UIKit
import CoreData

class CreateToDoViewController: UIViewController {
    
    var toDoTableVC : ToDoListTableViewController? = nil

    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        if let name = toDoTextField.text{
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "ToDoCoreData", in: context)!
            let newToDo = NSManagedObject(entity: entity, insertInto: context)
            
            newToDo.setValue(name, forKey: "name")
            newToDo.setValue(importantSwitch.isOn, forKey: "important")
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
 //           let toDo = ToDo(name: name, important: importantSwitch.isOn)
 //           toDoTableVC?.toDos.append(toDo)
 //           toDoTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}
