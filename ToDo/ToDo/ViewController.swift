//
//  ViewController.swift
//  ToDo
//
//  Created by Timothy Hang on 4/18/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMobileAds

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
  var toDos: Results<ToDo>!
  
  var realm: Realm!
  
  @IBOutlet weak var tableView: UITableView!

  @IBOutlet weak var bannerView: GADBannerView!
  
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    realm = try! Realm()
    toDos = realm.objects(ToDo.self)
    
    bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
    bannerView.rootViewController = self
    bannerView.load(GADRequest())
  }
  
  override func viewWillAppear(_ animated: Bool)
  {
    super.viewWillAppear(animated)
    tableView.reloadData()
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
    
    cell.titleTextField.text = aToDo.title
    cell.categoryTextField.text = aToDo.category

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
}





