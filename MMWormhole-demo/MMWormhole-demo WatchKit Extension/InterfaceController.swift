//
//  InterfaceController.swift
//  MMWormhole-demo WatchKit Extension
//
//  Created by Carl.Yang on 7/13/15.
//  Copyright (c) 2015 Carl.Yang. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    let wormhole = MMWormhole(applicationGroupIdentifier: "group.yangcun.watchkitdemosharingdata", optionalDirectory: "wormhole")
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.wormhole.listenForMessageWithIdentifier("letterIdentifier", listener: { (message) -> Void in
            self.label.setText((message as? String))
        })
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func buttonTapOne() {
        self.sendNumber(1)
    }

    @IBAction func buttonTapTwo() {
        self.sendNumber(2)
    }
    
    @IBAction func buttonTapThree() {
        self.sendNumber(3)
    }
    
    func sendNumber(number: Int) {
        self.wormhole.passMessageObject(number, identifier: "numberIdentifier")
    }

}
