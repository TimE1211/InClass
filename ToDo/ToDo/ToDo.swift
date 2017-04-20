//
//  ToDo.swift
//  ToDo
//
//  Created by Timothy Hang on 4/18/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation
import RealmSwift

class ToDo: Object
{
  dynamic var toDoId = UUID().uuidString
  
  dynamic var title = ""
  dynamic var category = ""
  dynamic var isDone = false
  
  override class func primaryKey() -> String?
  {
    return "toDoId"
  }
  
  override class func indexedProperties() -> [String]
  {
    return ["isDone"]
  }
  
  convenience init(title: String, category: String, done: Bool)
  {
    self.init()
    self.title = title
    self.category = category
    self.isDone = done
  }
}
