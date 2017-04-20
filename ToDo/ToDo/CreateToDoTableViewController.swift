//
//  CreateToDoTableViewController.swift
//  ToDo
//
//  Created by Timothy Hang on 4/20/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit
import RealmSwift

class CreateToDoTableViewController: UITableViewController, UITextFieldDelegate
{
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
  @IBOutlet weak var doneSwitch: UISwitch!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    title = "New ToDo"
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool
  {
    if let toDoTitle = textField.text, toDoTitle != ""
    {
      titleTextField.resignFirstResponder()
    }
    return false
  }

  @IBAction func createToDo(_ sender: UITapGestureRecognizer)
  {
    let realm = try! Realm()
    let selectedSegment = categorySegmentedControl.selectedSegmentIndex
//    let selectedSegmentName = categorySegmentedControl[selectedSegment]
    var category: String
    switch selectedSegment
    {
    case 0:
      category = "Chores"
    case 1:
      category = "Exercises"
    case 2:
      category = "Activities"
    default:
      category = ""
    }
    let aToDo = ToDo(title: titleTextField.text!, category: category, done: doneSwitch.isOn)
    try! realm.write {
      realm.add(aToDo)
    }
    navigationController?.popViewController(animated: true)
  }
  
  
  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }
  */

}
