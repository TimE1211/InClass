//
//  ToDoCell.swift
//  ToDo
//
//  Created by Timothy Hang on 4/18/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell
{
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var categoryTextField: UITextField!

  override func awakeFromNib()
  {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool)
  {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

}
