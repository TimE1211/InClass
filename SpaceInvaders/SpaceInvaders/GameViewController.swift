//
//  GameViewController.swift
//  SpaceInvaders
//
//  Created by Ben Gohlke on 8/23/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController
{
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    if let view = self.view as! SKView?
    {
      let scene = GameScene(size: view.frame.size)
      scene.scaleMode = .aspectFill
      
      view.presentScene(scene)
      view.ignoresSiblingOrder = true
      
      view.showsFPS = true
      view.showsNodeCount = true
    }
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
}
