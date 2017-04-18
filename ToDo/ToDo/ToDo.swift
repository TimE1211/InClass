//
//  ToDo.swift
//  ToDo
//
//  Created by Timothy Hang on 4/18/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

let kTitleKey = "title"
let kCategoryKey = "category"
let kDoneKey = "done"

class ToDo: NSObject, NSCoding
{
  var title: String
  var category: String
  var isDone: Bool
  
  init(title: String, category: String, done: Bool)
  {
    self.title = title
    self.category = category
    self.isDone = done
  }
  
  // MARK: - NSCoding
  
  required convenience init?(coder aDecoder: NSCoder)
  {
    guard let title = aDecoder.decodeObject(forKey: kTitleKey) as? String,
      let category = aDecoder.decodeObject(forKey: kCategoryKey) as? String else { return nil }
    
    let done = aDecoder.decodeBool(forKey: kDoneKey)
    
    self.init(title: title, category: category, done: done)
  }
  
  func encode(with aCoder: NSCoder)
  {
    aCoder.encode(title, forKey: kTitleKey)
    aCoder.encode(category, forKey: kCategoryKey)
    aCoder.encode(isDone, forKey: kDoneKey)
  }
}
