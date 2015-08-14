//
//  SettingsViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 8/2/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class SettingsViewController: UIViewController {
    
    
    @IBOutlet var emailText: UITextField!
    @IBOutlet var firstNameText: UITextField!
    @IBOutlet var lastNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        var requestParameters = ["fields": "id, email, first_name, last_name"]
        let userDetails = FBSDKGraphRequest(graphPath: "me", parameters: requestParameters)
        
        userDetails.startWithCompletionHandler { (connection, result, error:NSError!) -> Void in
            
            if(error != nil) {
                println("\(error.localizedDescription)")
                return
            }
            
            if(result != nil) {
                
                let userId:String = result["id"] as! String
                let userFirstName:String? = result["first_name"] as? String
                let userLastName:String? = result["last_name"] as? String
                let userEmail:String? = result["email"] as? String
                
                
                let myUser:PFUser = PFUser.currentUser()!
                
                // Save first name
                if(userFirstName != nil) {
                    myUser.setObject(userFirstName!, forKey: "first_name")
                    
                }
                
                //Save last name
                if(userLastName != nil) {
                    myUser.setObject(userLastName!, forKey: "last_name")
                }
                
                // Save email address
                if(userEmail != nil) {
                    myUser.setObject(userEmail!, forKey: "email")
                }
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                    
                    // Get Facebook profile picture
                    var userProfile = "https://graph.facebook.com/" + userId + "/picture?type=large"
                    let profilePictureUrl = NSURL(string: userProfile)
                    let profilePictureData = NSData(contentsOfURL: profilePictureUrl!)
                    
                    if(profilePictureData != nil) {
                        let profileFileObject = PFFile(data:profilePictureData!)
                        myUser.setObject(profileFileObject, forKey: "profile_picture")
                    }
                    
                }
                
                self.emailText.text = myUser["email"] as! String
                self.firstNameText.text = myUser["first_name"] as! String
                self.lastNameText.text = myUser["last_name"] as! String
                
            }
        }
        
        let myUser:PFUser = PFUser.currentUser()!
        self.emailText.text = myUser["email"] as! String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func savePressed(sender: AnyObject) {
        
        let myUser:PFUser = PFUser.currentUser()!
        
        // Save first name
        if(firstNameText.text != nil) {
            myUser.setObject(firstNameText.text!, forKey: "first_name")
            
        }
        
        //Save last name
        if(lastNameText.text != nil) {
            myUser.setObject(lastNameText.text!, forKey: "last_name")
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            myUser.saveInBackgroundWithBlock({ (success:Bool, error:NSError?) -> Void in
                
                if(success)
                {
                    println("User details are now updated")
                }
                
            })
            
        }
    }
    
    
    @IBAction func cancelPressed(sender: AnyObject) {
        performSegueWithIdentifier("UnwindToMapSegueID", sender: self)
        
        
    }

}
