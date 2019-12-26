//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Dilmurod Ubaydullaev on 12/26/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import UIKit
import CoreData

class ToDoListTableViewController: UITableViewController {
    
    var toDos = [ToDo]()
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos(){
        toDos.removeAll()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //let entity = NSEntityDescription.entity(forEntityName: "ToDoCoreData", in: context)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoCoreData")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
               //print(data.value(forKey: "name") as! String)
                //print(data.value(forKey: "important") as! Bool)
                let toDo = ToDo(name: data.value(forKey: "name") as! String, important: data.value(forKey: "important") as! Bool)
                toDos.append(toDo)
                tableView.reloadData()
          }
            
        } catch {
            
            print("Failed")
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = toDos[indexPath.row].name
        if(toDos[indexPath.row].important==true){
            cell.textLabel?.text = "‼️ " + (cell.textLabel?.text)!
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let createVC = segue.destination as? CreateToDoViewController{
            createVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController{
            completeVC.toDo = (sender as! ToDo)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToComplete", sender: toDos[indexPath.row])
    }
    
    
}
