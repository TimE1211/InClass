//
//  ViewController.swift
//  DynamicsDemo
//
//  Created by Timothy Hang on 4/13/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate
{
  var animator: UIDynamicAnimator!
  var gravity: UIGravityBehavior!
  var collision: UICollisionBehavior!
  var square: UIView!
  var snap: UISnapBehavior!
  var firstContact = true
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    square = UIView(frame : CGRect(x: 100, y: 100, width: 100, height: 100))
    square.backgroundColor = UIColor.gray
    view.addSubview(square)
    
    animator = UIDynamicAnimator(referenceView: view)
    gravity = UIGravityBehavior(items: [square])
    animator.addBehavior(gravity)
    collision = UICollisionBehavior(items: [square])
    collision.translatesReferenceBoundsIntoBoundary = true
    animator.addBehavior(collision)
    
    let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
    barrier.backgroundColor = UIColor.red
    view.addSubview(barrier)
    
    collision.addItem(barrier)
    collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
    
    collision.collisionDelegate = self
    
    let itemBehavior = UIDynamicItemBehavior(items: [square])
    itemBehavior.elasticity = 0.6
    animator.addBehavior(itemBehavior)
    
    var updateCount = 0
    collision.action = {
      if updateCount % 3 == 0
      {
        let outline = UIView(frame: self.square.bounds)
        outline.transform = self.square.transform
        outline.center = self.square.center
        outline.alpha = 0.5
        outline.backgroundColor = UIColor.clear
        outline.layer.borderColor = self.square.layer.presentation()?.backgroundColor
        outline.layer.borderWidth = 1.0
        self.view.addSubview(outline)
      }
      updateCount += 1
    }
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  
  func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint)
  {
    print("Boundary contact occurred \(String(describing: identifier))")
    let collidingView = item as! UIView
    collidingView.backgroundColor = UIColor.yellow
    UIView.animate(withDuration: 0.3, animations: {
      collidingView.backgroundColor = UIColor.gray
    })
    
//    if firstContact
//    {
//      firstContact = false
//      let square = UIView(frame: CGRect(x: 30, y: 100, width: 100, height: 100))
//      square.backgroundColor = UIColor.gray
//      view.addSubview(square)
//      
//      collision.addItem(square)
//      gravity.addItem(square)
//      
//      let attach = UIAttachmentBehavior(item: collidingView, attachedTo: square)
//      animator.addBehavior(attach)
//    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
  {
    if snap != nil
    {
      animator.removeBehavior(snap)
    }
    
    let touch = touches.first!
    snap = UISnapBehavior(item: square, snapTo: touch.location(in: view))
    animator.addBehavior(snap)
  }
}

