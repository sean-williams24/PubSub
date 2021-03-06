//
//  Messaging.swift
//  Carv Test
//
//  Created by Sean Williams on 19/05/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import Combine
import CoreBluetooth
import Foundation

struct Listener {
    var name: String
    var handler: (Any) -> Void
}

class Events {
    
    var listeners: [Listener] = [];
    
    func publish(name: String, args: Any) {
        for consumer in self.listeners {
            if(consumer.name == name) {
                consumer.handler(args);
            }
        }
    }
    
    func subscribe(name: String, handler: @escaping (Any) -> Void) {
        self.listeners.append(
            Listener(name: name, handler: handler)
        )
    }
    
}




























//class Messaging {
//
//    let bluetoothPublisher = NotificationCenter.Publisher(center: .default, name: .bluetoothPermissions, object: nil)
//
//
//    class func subscribe(notification: Notification.Name) {
//
//    }
//
//
//    class func publish() {
//
//    }
//}
//
//extension Notification.Name {
//    static let bluetoothPermissions = Notification.Name("bluetooth_permissions")
//}
