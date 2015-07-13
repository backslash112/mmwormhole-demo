//
//  ViewController.swift
//  MMWormhole-demo
//
//  Created by Carl.Yang on 7/13/15.
//  Copyright (c) 2015 Carl.Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let wormhole = MMWormhole(applicationGroupIdentifier: "group.yangcun.watchkitdemosharingdata", optionalDirectory: "wormhole")
    
    @IBOutlet weak var numberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wormhole.listenForMessageWithIdentifier("numberIdentifier", listener: { (number) -> Void in
            self.numberLabel.text = String(number as! Int)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Send to the watch kit.
    @IBAction func segmentValueChanged(sender: AnyObject) {
        self.wormhole.passMessageObject((sender as! UISegmentedControl).titleForSegmentAtIndex((sender as! UISegmentedControl).selectedSegmentIndex), identifier: "letterIdentifier")
    }
}

