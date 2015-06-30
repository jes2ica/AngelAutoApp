//
//  BottomPanelViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/30/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

class BottomPanelViewController: UIViewController {
    

    @IBOutlet var acceptBtn: UIButton!
    @IBOutlet var refuseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        acceptBtn.layer.cornerRadius = 20
        refuseBtn.layer.cornerRadius = 20

        var myColor : UIColor = UIColor( red: 1.0, green: 1.0, blue:1.0, alpha: 1.0 )
        acceptBtn.layer.borderColor = myColor.CGColor
        acceptBtn.layer.borderWidth = 2
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
