//
//  SignInViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/23/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var facebookBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
