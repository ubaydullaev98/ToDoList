//
//  CompleteViewController.swift
//  ToDoList
//
//  Created by Dilmurod Ubaydullaev on 12/26/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import UIKit
import CoreData

class CompleteViewController: UIViewController {
    
    var toDo : ToDo? = nil

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = toDo?.name

    }
    
    @IBAction func completeButtonPressed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoCoreData")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if((data.value(forKey: "name") as! String) == toDo?.name){
                    if((data.value(forKey: "important") as! Bool) == toDo?.important){
                        context.delete(data)
                    }
                }
          }
            
        } catch {
            
            print("Failed")
        }
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
}
