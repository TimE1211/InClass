//
//  ViewController.swift
//  ToDo
//
//  Created by Timothy Hang on 4/18/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

let kToDosKey = "todos"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
  var toDos = [ToDo]()
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad()
  {
    super.viewDidLoad()
//    let aToDo = ToDo(title: "take out trash", category: "chores", done: false)
//    let anotherToDo = ToDo(title: "walk the dog", category: "exercise", done: true)
//    toDos.append(aToDo)
//    toDos.append(anotherToDo)
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
    cell.titleLabel.text =   aToDo.title
    cell.categoryLabel.text = aToDo.category
    
    if aToDo.isDone
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
      if selectedToDo.isDone
      {
        selectedToDo.isDone = false
        selectedCell.accessoryType = .none
      }
      else
      {
        selectedToDo.isDone = true
        selectedCell.accessoryType = .checkmark
      }
    }
  }
  
  func saveToDos()
  {
    let toDoData = NSKeyedArchiver.archivedData(withRootObject: toDos)
    let defaults = UserDefaults.standard        //singleton -> one  unique object(standard object)
    defaults.set(toDoData, forKey: kToDosKey)
    defaults.synchronize()
  }
  
  func loadToDos()
  {
    if toDos.count == 0
    {
      let defaults = UserDefaults.standard
      if let toDoData = defaults.object(forKey: kToDosKey) as? Data
      {
        if let savedToDos = NSKeyedUnarchiver.unarchiveObject(with: toDoData) as? [ToDo]
        {
          toDos = savedToDos
          tableView.reloadData()
        }
      }
    }
  }
}





