//
//  Phase.swift
//  MoonPhase
//
//  Created by Timothy Hang on 4/27/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

class Phase: NSObject
{
  let date: String
  let phase: String
  let imageName: String
  let illumination: Int
  
  init(with dictionary: [String: Any])
  {
    date = dictionary["date"] as! String
    phase = dictionary["phase"] as! String
    imageName = dictionary["image"] as! String
    illumination = dictionary["illumination"] as! Int
  }
}

extension Phase
{
  static func loadPhases() -> [Phase]?
  {
    do
    {
      let filePath = Bundle.main.path(forResource: "phases", ofType: "json")
      let dataFromFile = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
      let phaseData = try JSONSerialization.jsonObject(with: dataFromFile!, options: []) as! [[String: Any]]
      var phases = [Phase]()
      for phaseDictionary in phaseData
      {
        let aPhase = Phase(with: phaseDictionary)
        phases.append(aPhase)
      }
      return phases
    }
    catch
    {
      print(error)
      return nil
    }
  }
}
