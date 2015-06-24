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
        
        image.image = UIImage(named:"logo.png")
        facebookBtn.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
