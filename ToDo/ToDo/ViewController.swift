//
//  ViewController.swift
//  ToDo
//
//  Created by Timothy Hang on 4/18/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit
import CoreData

let kToDosKey = "todos"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
  var toDos = [ToDoCD]()
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    editButtonItem = 
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoCD")
    do
    {
      if let fetchResults = try context.fetch(fetchRequest) as? [ToDoCD]
      {
        toDos = fetchResults
      }
    }
    catch {
      let nserror = error as NSError
      NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return toDos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
    
    let aToDo = toDos[indexPath.row]
    cell.titleTextField.text =   aToDo.title
    cell.categoryTextField.text = aToDo.category
    
    if aToDo.done
    {
      cell.accessoryType = .checkmark
    }
    else
    {
      cell.accessoryType = .none
    }
    
    return cell
  }
  
  // MARK: - Table view delegate

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
  {
//    tableView.cellForRow(at: indexPath)?.accessoryType = .none
    tableView.deselectRow(at: indexPath, animated: true)
    
    if let selectedCell = tableView.cellForRow(at: indexPath)
    {
      let selectedToDo = toDos[indexPath.row]
      if selectedToDo.done
      {
        selectedToDo.done = false
        selectedCell.accessoryType = .none
      }
      else
      {
        selectedToDo.done = true
        selectedCell.accessoryType = .checkmark
      }
    }
  }
  
//  func saveToDos()
//  {
//    let toDoData = NSKeyedArchiver.archivedData(withRootObject: toDos)
//    let defaults = UserDefaults.standard        //singleton -> one  unique object(standard object)
//    defaults.set(toDoData, forKey: kToDosKey)
//    defaults.synchronize()
//  }
//  
//  func loadToDos()
//  {
//    if toDos.count == 0
//    {
//      let defaults = UserDefaults.standard
//      if let toDoData = defaults.object(forKey: kToDosKey) as? Data
//      {
//        if let savedToDos = NSKeyedUnarchiver.unarchiveObject(with: toDoData) as? [ToDoCD]
//        {
//          toDos = savedToDos
//          tableView.reloadData()
//        }
//      }
//    }
//  }
}





