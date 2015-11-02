//
//  ViewController.swift
//  iOvulation
//
//  Created by qingjiezhao on 7/27/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var itemString:String?
    
    @IBOutlet weak var txtValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Random number is \(Int.random(1, max: 10)), currentDevice info \(Device.currentDevice), version \(Device.currentDeviceVersion) ,Height \(Device.currentDeviceHeight)")
        
        //txtValue.text = itemString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





