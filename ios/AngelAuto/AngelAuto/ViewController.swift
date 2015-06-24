//
//  ViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/18/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signInBtn: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bg2.png")!)
        
        signInBtn.layer.cornerRadius = 20
        signUpButton.layer.cornerRadius = 20
        
        var myColor : UIColor = UIColor( red: 1.0, green: 1.0, blue:1.0, alpha: 1.0 )
        signUpButton.layer.borderColor = myColor.CGColor
        signUpButton.layer.borderWidth = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

