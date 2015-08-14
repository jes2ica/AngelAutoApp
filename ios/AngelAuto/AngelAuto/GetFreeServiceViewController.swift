//
//  GetFreeServiceViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 8/8/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit
import Branch

class GetFreeServiceViewController: UIViewController {

    @IBOutlet var inviteBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        inviteBtn.layer.cornerRadius = 20
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func invitePressed(sender: AnyObject) {
        
        var items: Array = [AnyObject]()
        
        // Adding text
        let shareString = "Please check out the AngelAuto and get free service : )"
        
        // Adding an image
        items.append(shareString)
        if let amazingImage: UIImage = UIImage(named: "redshoes.png") {
            items.append(amazingImage)
        }
        
        // Custom data
        var params = ["product_id": "1234"]
        params["product_name"] = "Red Shoes"
        params["$og_title"] = "Red Shoes $5"
        params["$og_image_url"] = "https://mysite.com/redshoes.png"
        params["$og_description"] = "Check out these awesome red shoes! Only $5."
        
        let tags = ["version_213"]
        let feature = "share"
        let stage = "post_purchase"
        
        // Adding a link -- Branch UIActivityItemProvider
        let itemProvider = Branch.getBranchActivityItemWithParams(params, feature: feature, stage: stage, tags: tags)
        items.append(itemProvider)
        // Pass this in the NSArray of ActivityItems when initializing a UIActivityViewController
        let shareViewController = UIActivityViewController(activityItems: items,
            applicationActivities: nil)
        // Present the share sheet
        self.navigationController?.presentViewController(shareViewController,
            animated: true,
            completion: nil)
        
    }
}
