//
//  SignInViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/23/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import FBSDKLoginKit

class SignInViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var facebookBtn: FBSDKLoginButton!
    
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    @IBOutlet var message: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = false
        self.navigationController?.navigationBarHidden = false
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        UITextField.appearance()
        
        self.view.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:Selector("viewTapped:"))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        image.image = UIImage(named:"logo.png")
        facebookBtn.layer.cornerRadius = 20
        
        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
        
    }
    
    // Facebook login
    @IBAction func facebookLogin(sender: AnyObject) {
        
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile","email"], block: { (user:PFUser?, error:NSError?) -> Void in
            
            println(user)
            println("Current user token=\(FBSDKAccessToken.currentAccessToken().tokenString)")
            println("Current user id \(FBSDKAccessToken.currentAccessToken().userID)")
            
            let mapViewController:UIViewController = MapViewController()
            self.presentViewController(mapViewController, animated: true, completion: nil)


        })
        
    }
    
    @IBAction func signIn(sender: AnyObject) {
        
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        var email = emailText.text
        email = email.lowercaseString
        
        var password = passwordText.text
        
        PFUser.logInWithUsernameInBackground(email, password:password) {
            (user: PFUser?, error: NSError?) -> Void in

            if user != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    
                    let mapViewController = MapViewController()
                    self.presentViewController(mapViewController, animated: true, completion: nil)
                    
                }
            } else {
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "Please try again!"
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func viewTapped(tap: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}
