//
//  ChartViewController.swift
//  iOvulation
//
//  Created by qingjiezhao on 7/27/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleDict = [NSForegroundColorAttributeName: UIColor.orangeColor()] as [String : AnyObject]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        self.navigationController?.navigationBar.tintColor = UIColor.orangeColor()
        
        let image = UIImage(named: "nav_background")
        self.navigationController!.navigationBar.setBackgroundImage(image,
            forBarMetrics: .Default)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnTapped(sender: AnyObject) {
        

    }
    
    @IBAction func btn1Tapped(sender: AnyObject) {

    }
    
    @IBAction func btn2Tapped(sender: AnyObject) {
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "segue1"{
            let controller = segue.destinationViewController as! ViewController
            controller.title = "segue1"
            controller.itemString = sender as? String
            
        }
        if segue.identifier == "segue2"{
            let controller1 = segue.destinationViewController as! StockChartViewController1
            controller1.title = "segue2"
            controller1.itemString = sender as? String
            
        }
        if segue.identifier == "segue3"{
            let bleViewController = segue.destinationViewController as! BLEViewController
            bleViewController.title = "segue3"
            //bleViewController.itemString = sender as? String
            
        }
    }
    
    //unwind
    @IBAction func close(segue: UIStoryboardSegue) {
        print("closed")
    }
    

    
}

