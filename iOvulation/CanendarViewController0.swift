//
//  CanendarViewController0.swift
//  iOvulation
//
//  Created by qingjiezhao on 7/27/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class CanendarViewController0: UIViewController {
    
    var bln : Bool = false
    
    @IBOutlet weak var btnHello: UIButton!
    @IBOutlet weak var btnWorld: UIButton!
    
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleDict = [NSForegroundColorAttributeName: UIColor.orangeColor()] as [String : AnyObject]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        
        let image = UIImage(named: "nav_background")
        
        self.navigationController!.navigationBar.setBackgroundImage(image,
            forBarMetrics: .Default)
        
        // Do any additional setup after loading the view, typically from a nib.
        lblName.text = NSLocalizedString("Welcome", comment: "Welcome")
        
        imgView.image = UIImage(named: "hangge.png")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HelloTapped(sender: AnyObject) {
        let image0 = UIImage(named: "btn_sel")
        btnHello.setBackgroundImage(image0, forState: UIControlState.Normal)
        btnHello.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        
        let image1 = UIImage(named: "btn_unsel")
        btnWorld.setBackgroundImage(image1, forState: .Normal)
        btnWorld.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
    }
    
    @IBAction func WorldTapped(sender: AnyObject) {
        let image0 = UIImage(named: "btn_unsel")
        btnHello.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        btnHello.setBackgroundImage(image0, forState: .Normal)
        
        let image1 = UIImage(named: "btn_sel")
        btnWorld.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        btnWorld.setBackgroundImage(image1, forState: .Normal)
        
        
        
    }
       
}

