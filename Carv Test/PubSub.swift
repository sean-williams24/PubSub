//
//  Messaging.swift
//  Carv Test
//
//  Created by Sean Williams on 19/05/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import Foundation

struct Listener {
    var event: EventType
    var handler: (Any) -> Void
}

enum EventType {
    case Bluetooth
    case Temperature
    case Acceleromter
}


class PubSub {
    
    static var listeners: [Listener] = []
    
    static func publish(event: EventType, data: Any) {
        for listener in self.listeners {
            if listener.event == event {
                listener.handler(data)
            }
        }
    }
    
    static func subscribe(event: EventType, handler: @escaping (Any) -> Void) {
        self.listeners.append(
            Listener(event: event, handler: handler)
        )
    }
    
}

