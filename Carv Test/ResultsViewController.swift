//
//  ResultsViewController.swift
//  Carv Test
//
//  Created by Sean Williams on 20/05/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Events.subscribe(name: "Temp") { tempMessage in
            let message = tempMessage as? String ?? "No Message"
            self.tempLabel.text = message
            print(message)
            print("Subscribed")
        }
    }

}
