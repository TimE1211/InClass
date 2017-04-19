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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate
{
  var toDos = [ToDoCD]()
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = editButtonItem
    
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
  
  override func setEditing(_ editing: Bool, animated: Bool)
  {
    super.setEditing(editing, animated: animated)
    tableView.setEditing(editing, animated: animated)
    
    if !editing
    {
      (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
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
    
    if tableView.isEditing
    {
      cell.titleTextField.isEnabled = true
      cell.categoryTextField.isEnabled = true
    }
    else
    {
      cell.titleTextField.isEnabled = false
      cell.categoryTextField.isEnabled = false
    }
    
    if let title = aToDo.title,
      let category = aToDo.category
    {
      cell.titleTextField.text = title
      cell.categoryTextField.text = category
    }
    else
    {
      cell.titleTextField.becomeFirstResponder()
    }
    
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
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
  {
    if editingStyle == .delete
    {
      let toDoToDelete = toDos[indexPath.row]
      context.delete(toDoToDelete)
      toDos.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool
  {
    if let contentView = textField.superview,
      let cell = contentView.superview as? ToDoCell,
      let indexPath = tableView.indexPath(for: cell)
      {
        let selectedToDo = toDos[indexPath.row]
        if textField.text != ""
        {
          if textField == cell.titleTextField
          {
            selectedToDo.title = textField.text
            cell.categoryTextField.becomeFirstResponder()
          }
          else if textField == cell.categoryTextField
          {
            selectedToDo.category = textField.text
            cell.categoryTextField.resignFirstResponder()
          }
        }
      }
    return false
  }

  @IBAction func addNewToDo(sender: UIBarButtonItem)
  {
    let aToDo = NSEntityDescription.insertNewObject(forEntityName: "ToDoCD", into: context) as! ToDoCD
    toDos.append(aToDo)
    setEditing(true, animated: true)
    tableView.reloadData()
  }
  
}





