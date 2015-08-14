//
//  SignUpViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/18/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class SignUpViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var nameText: UITextField!
    
    @IBOutlet var usernameText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var phoneText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var confirmText: UITextField!
    
    @IBOutlet var facebookBtn: UIButton!
    
    @IBOutlet var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = false
        self.navigationController?.navigationBarHidden = false

        
        self.view.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:Selector("viewTapped:"))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        image.image = UIImage(named:"logo.png")
        facebookBtn.layer.cornerRadius = 20
        
        
        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
    }
    
    
    
    @IBAction func signUp(sender: AnyObject) {
        
        var username = nameText.text
        var email = emailText.text
        var password = passwordText.text
        
        // Ensure username is lowercase
        email = email.lowercaseString
        
        // Add email address validation
        
        // Start activity indicator
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        // Create the user
        var user = PFUser()
        user.username = username
        user.password = password
        user.email = email
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            
            if error == nil {
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    let mapViewController = MapViewController()
                    self.presentViewController(mapViewController, animated: true, completion: nil)
                }
                
            } else {
                
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)" + "!"
                }
            }
        }
        
    }
   


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goBtnPressed(sender: AnyObject) {
        
    }
    
    func viewTapped(tap: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }


}
