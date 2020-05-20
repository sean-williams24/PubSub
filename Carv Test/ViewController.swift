//
//  ViewController.swift
//  Carv Test
//
//  Created by Sean Williams on 19/05/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import CoreBluetooth
import CoreMotion
import UIKit

class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    var centralManager: CBCentralManager?
    var motionManager: CMMotionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                if let data = data {
                    Events.publish(name: "Accel", args: data)
                }
            }
        }
    }


    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        Events.publish(name: "BT", args: "Bluetooth state has changed to code: \(central.state.rawValue)")
    }
    
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        Events.publish(name: "Temp", args: sender.value)
    }
    
}

