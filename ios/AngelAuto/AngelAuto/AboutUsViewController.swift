//
//  AboutUsViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 8/3/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        image.image = UIImage(named:"logo.png")
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = 
            [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    override func viewDidAppear(animated: Bool) {
        
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
