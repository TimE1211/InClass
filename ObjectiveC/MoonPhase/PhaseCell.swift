//
//  PhaseCell.swift
//  MoonPhase
//
//  Created by Timothy Hang on 4/27/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class PhaseCell: UITableViewCell
{

  @IBOutlet weak var phaseImageView: UIImageView!
  @IBOutlet weak var phaseNameLabel: UILabel!
  @IBOutlet weak var illuminationLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool)
  {
    super.setSelected(selected, animated: animated)
  }

}
