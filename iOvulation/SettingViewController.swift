//
//  SettingViewController.swift
//  iOvulation
//
//  Created by qingjiezhao on 7/27/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit
import MessageUI

class SettingViewController: UITableViewController , MFMailComposeViewControllerDelegate{

    var itemString:String?
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.backgroundColor = UIColor(red: 243.0/255, green: 243.0/255, blue: 243.0/255, alpha: 1)
        
        let titleDict = [NSForegroundColorAttributeName: UIColor.orangeColor()] as [String : AnyObject]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        self.navigationController?.navigationBar.tintColor = UIColor.orangeColor()
        
        let image = UIImage(named: "nav_background")
        self.navigationController!.navigationBar.setBackgroundImage(image,
            forBarMetrics: .Default)

        print("Random number is \(Int.random(1, max: 10)), currentDevice info \(Device.currentDevice), version \(Device.currentDeviceVersion) ,Height \(Device.currentDeviceHeight) , Width \(Device.currentDeviceWidth) , iphone is \(Device.isPhone()), retina is \(Device.IS_RETINA())")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = UIColor(red: 151.0/255, green: 193.0/255, blue: 100.0/255, alpha: 1)
        let font = UIFont(name: "HelveticaNeue", size: 18.0)
        headerView.textLabel!.font = font!
        
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        //println("current value is \(indexPath.row) , \(indexPath.section) \(indexPath)")
        
        switch (indexPath.section, indexPath.row) {
            case (2, 0):
                print("Syracuse")
            case (2, 1):
                print("Feedback")
                let emailViewController = configureMailComposeViewController()
                if MFMailComposeViewController.canSendMail(){
                    self.presentViewController(emailViewController, animated: true, completion: nil)
                }else{
                    self.showSendMailErrorAlert()
                }
            case (2, 2):
                print("About")
                self.performSegueWithIdentifier("aboutSegue", sender: itemString)
            
            default:
                print("default")
                break
        }
        
        return nil
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "aboutSegue"{
            let aboutViewController = segue.destinationViewController as! AboutViewController
            aboutViewController.title = "About"
            aboutViewController.itemString = sender as? String
            
        }
    }
    
    
    func configureMailComposeViewController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["zhaoqingjie@gmail.com"])
        mailComposerVC.setSubject("Feedback about ...")
        mailComposerVC.setMessageBody("Hi there: \n\n I would like to share the following feedback...\n", isHTML: false)
        return mailComposerVC
    }
    
    func showSendMailErrorAlert(){
  
        let alert = UIAlertController(title: "Could not send email", message: "Your device could not send email, please check email account configuration and try again.", preferredStyle: UIAlertControllerStyle.Alert)
        //alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                print("default")
                
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController,
        didFinishWithResult result: MFMailComposeResult, error: NSError?) {
            controller.dismissViewControllerAnimated(true, completion: nil)
            
            switch result.rawValue{
            case MFMailComposeResultSent.rawValue:
                print("Sent")
            case MFMailComposeResultCancelled.rawValue:
                print("Canceled")
            case MFMailComposeResultSaved.rawValue:
                print("Saved")
            case MFMailComposeResultFailed.rawValue:
                print("fail")
            default:
                print("didn't send")
                break
            }
            self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    @IBAction func switch1Tapped(sender: AnyObject) {
        let switch1Text = switch1.on ? "Yes" : "No"
        print("switch1Text \(switch1Text)")
    }
    
    @IBAction func switch2Tapped(sender: AnyObject) {
        let switch2Text = switch2.on ? "Yes" : "No"
        print("switch2Text \(switch2Text)")
    }
    
    
}

