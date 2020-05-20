//
//  Messaging.swift
//  Carv Test
//
//  Created by Sean Williams on 19/05/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import Foundation

struct Listener {
    var name: String
    var handler: (Any) -> Void
}

class Events {
    
    static var listeners: [Listener] = []
    
    static func publish(name: String, args: Any) {
        for listener in self.listeners {
            if(listener.name == name) {
                listener.handler(args)
            }
        }
    }
    
    static func subscribe(name: String, handler: @escaping (Any) -> Void) {
        print("subscribe called")
        self.listeners.append(
            Listener(name: name, handler: handler)
        )
        
        print(self.listeners)
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
