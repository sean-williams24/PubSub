//
//  ResultsViewController.swift
//  Carv Test
//
//  Created by Sean Williams on 20/05/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import CoreMotion
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var accelLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Events.subscribe(name: "Temp") { tempMessage in
            let temp = tempMessage as? Float ?? 0
            self.tempLabel.text = "Temperature: \(temp)"
        }
        
        Events.subscribe(name: "BT") { eventData in
             let message = eventData as? String ?? "No Message"
            self.title = message
         }
        
        Events.subscribe(name: "Accel") { eventData in
            let accelData = eventData as? CMAccelerometerData
            if let accelData = accelData {
                self.accelLabel.text = "Accelerometer Z value: \(accelData.acceleration.z)"
            }
        }
    }

}
