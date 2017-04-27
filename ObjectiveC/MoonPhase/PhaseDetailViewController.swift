//
//  PhaseDetailViewController.swift
//  MoonPhase
//
//  Created by Timothy Hang on 4/27/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class PhaseDetailViewController: UIViewController
{
  @IBOutlet weak var phaseLabel: UILabel!
  @IBOutlet weak var illuminationLabel: UILabel!
  @IBOutlet weak var phaseImageView: UIImageView!
 
  var aPhase: Phase!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    title = aPhase.date
    phaseLabel.text = aPhase.phase
    illuminationLabel.text = "\(aPhase.illumination)%"
    phaseImageView.image = UIImage(named: aPhase.imageName)
    
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
}
