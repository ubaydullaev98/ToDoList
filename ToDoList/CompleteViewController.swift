//
//  CompleteViewController.swift
//  ToDoList
//
//  Created by Dilmurod Ubaydullaev on 12/26/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var toDo : ToDo? = nil

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = toDo?.name

    }
    
    @IBAction func completeButtonPressed(_ sender: UIButton) {
    }
    
}
