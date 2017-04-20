//
//  ViewController.swift
//  ToDo
//
//  Created by Timothy Hang on 4/18/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate
{
  var toDos: Results<ToDo>!
  
  var realm: Realm!
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = editButtonItem
    
    realm = try! Realm()
    toDos = realm.objects(ToDo.self)
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }

  override func setEditing(_ editing: Bool, animated: Bool)
  {
    super.setEditing(editing, animated: animated)
    tableView.setEditing(editing, animated: animated)
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
    
    cell.titleTextField.text = aToDo.title
    cell.categoryTextField.text = aToDo.category
    
    if aToDo.title == ""
    {
      cell.titleTextField.becomeFirstResponder()
    }
    else if aToDo.category == ""
    {
      cell.categoryTextField.becomeFirstResponder()
    }
    
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
    tableView.deselectRow(at: indexPath, animated: true)
    
    if let selectedCell = tableView.cellForRow(at: indexPath)
    {
      let selectedToDo = toDos[indexPath.row]
      if selectedToDo.isDone
      {
        try! realm.write {
          selectedToDo.isDone = false
        }
        selectedCell.accessoryType = .none
      }
      else
      {
        try! realm.write {
          selectedToDo.isDone = true
        }
        selectedCell.accessoryType = .checkmark
      }
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
  {
    if editingStyle == .delete
    {
      try! realm.write {
        let toDoToDelete = toDos[indexPath.row]
        self.realm.delete(toDoToDelete)
      }
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
        if let text = textField.text,
          text != ""
        {
          if textField == cell.titleTextField
          {
            try! realm.write {
              selectedToDo.title = text
            }
            cell.categoryTextField.becomeFirstResponder()
          }
          else if textField == cell.categoryTextField
          {
            try! realm.write {
              selectedToDo.category = text
            }
            cell.categoryTextField.resignFirstResponder()
          }
        }
      }
    return false
  }

  @IBAction func addNewToDo(sender: UIBarButtonItem)
  {
    let aToDo = ToDo(title: "", category: "", done: false)
    try! realm.write {
      realm.add(aToDo)
    }
    setEditing(true, animated: true)
    tableView.reloadData()
  }
}





