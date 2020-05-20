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
    var events = PubSub()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                if let data = data {
                    PubSub.publish(event: .Acceleromter, data: data)
                }
            }
        }
    }


    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        PubSub.publish(event: .Bluetooth, data: "Bluetooth state has changed to code: \(central.state.rawValue)")
    }
    
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        PubSub.publish(event: .Temperature, data: sender.value)
    }
}

