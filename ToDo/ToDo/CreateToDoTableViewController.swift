//
//  CreateToDoTableViewController.swift
//  ToDo
//
//  Created by Timothy Hang on 4/20/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications

class CreateToDoTableViewController: UITableViewController, UITextFieldDelegate
{
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
  @IBOutlet weak var doneSwitch: UISwitch!
  
  @IBOutlet weak var reminderSegmentedControl: UISegmentedControl!
  @IBOutlet weak var reminderDatePicker: UIDatePicker!
  var todoId = String()
  
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
    let content = UNMutableNotificationContent()
    content.title = "Reminder"
    content.body = titleTextField.text!
    content.badge = 1
    content.sound = UNNotificationSound.default()
    content.userInfo = ["objectUUID": UUID().uuidString]
    todoId = content.userInfo["objectUUID"] as! String
    
    let request: UNNotificationRequest
    if reminderDatePicker.datePickerMode == .dateAndTime
    {
      let trigger = determineDateTrigger()
      request = UNNotificationRequest(identifier: "Reminder", content: content, trigger: trigger)
    }
    else// if reminderDatePicker.datePickerMode == .countDownTimer
    {
      let trigger = determineCountdownTrigger()
      request = UNNotificationRequest(identifier: "Reminder", content: content, trigger: trigger)
    }
    
    let center = UNUserNotificationCenter.current()
    center.add(request) {
      error in
      if let theError = error
      {
        print(theError.localizedDescription)
      }
      else
      {
        print("User notification scheduled successfully.")
      }
    }
    
    let realm = try! Realm()
    let selectedSegment = categorySegmentedControl.selectedSegmentIndex
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
    let aToDo = ToDo(title: titleTextField.text!, category: category, done: doneSwitch.isOn, toDoId: todoId)
    try! realm.write {
      realm.add(aToDo)
    }
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func dateStyleSegmentedControlValueChanged(_  sender: UISegmentedControl)
  {
    switch sender.selectedSegmentIndex
    {
    case 0:
      reminderDatePicker.datePickerMode = .dateAndTime
    case 1:
      reminderDatePicker.datePickerMode = .countDownTimer
    default: break
    }
  }
  
  func determineDateTrigger() -> UNCalendarNotificationTrigger
  {
    let calendar = Calendar(identifier: .gregorian)
    let dateComponents = calendar.dateComponents([.day, .month, .year, .hour, .minute], from: reminderDatePicker.date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    
    return trigger
  }
  
  func determineCountdownTrigger() -> UNTimeIntervalNotificationTrigger
  {
    return UNTimeIntervalNotificationTrigger(timeInterval: reminderDatePicker.countDownDuration, repeats: false)
  }
}

extension CreateToDoTableViewController       //authorize reminder notifications
{
  func authorizeReminder()
  {
    let center = UNUserNotificationCenter.current()
    center.getNotificationSettings() {
      settings in
      if settings.authorizationStatus == UNAuthorizationStatus.notDetermined
      {
        center.requestAuthorization(options: [.alert, .sound, .badge]) {
          granted, error in
          if granted
          {
            print("Authorization was granted for alerts and sounds.")
          }
          else
          {
            print("Authorization was denied.")
          }
        }
      }
    }
  }
}
