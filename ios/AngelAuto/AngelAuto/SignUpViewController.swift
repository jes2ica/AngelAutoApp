//
//  SignUpViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/18/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var facebookBtn: UIButton!    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goBtnPressed(sender: AnyObject) {
        let mapViewController = MapViewController()
        self.presentViewController(mapViewController, animated: true, completion: nil)
    }
    
    func viewTapped(tap: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }


}
