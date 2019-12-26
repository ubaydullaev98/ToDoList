//
//  ToDo.swift
//  ToDoList
//
//  Created by Dilmurod Ubaydullaev on 12/26/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import Foundation

class ToDo{
    var name = ""
    var important = false
    
    init(name : String, important : Bool) {
        self.name = name
        self.important = important
    }
}
