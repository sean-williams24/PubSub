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

    let messenger = Messaging()
    var centralManager: CBCentralManager?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        messenger.subscribe(name: "BT") { eventData in
            let message = eventData as? String ?? "No Message"
            
            print(message)
        }
        
        
        
    }


    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        messenger.publish(name: "BT", args: "Bluetooth permission has changed")
    }
}

