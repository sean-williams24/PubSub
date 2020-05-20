//
//  ViewController.swift
//  Carv Test
//
//  Created by Sean Williams on 19/05/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import CoreBluetooth
import UIKit

class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    var centralManager: CBCentralManager?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        Events.subscribe(name: "BT") { eventData in
            let message = eventData as? String ?? "No Message"
            self.label.text = message
        }
        
        
//        Events.subscribe(name: "Temp") { eventData in
//            self.title = eventData as? String ?? "No Message"
//        }
        
    }


    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        Events.publish(name: "BT", args: "Bluetooth state has changed to code: \(central.state.rawValue)")
    }
    
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        Events.publish(name: "Temp", args: "Temperature: \(sender.value)")
    }
    
}

