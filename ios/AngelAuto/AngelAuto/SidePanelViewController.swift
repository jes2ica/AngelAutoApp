//
//  SidePanelViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/24/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

class SidePanelViewController: UIViewController {
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    
    @IBOutlet var carWashLabel: UILabel!
    @IBOutlet var carRepairLabel: UILabel!
    
    @IBOutlet var exterior: UIButton!
    @IBOutlet var exandinBtn: UIButton!
    @IBOutlet var detailBtn: UIButton!
    
    
    @IBOutlet var oilChangeBtn: UIButton!
    @IBOutlet var tireBtn: UIButton!
    @IBOutlet var examBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.image = UIImage(named: "menu_bg.jpg")
        image2.image = UIImage(named:"menu_bg.png")
        
        carWashLabel.backgroundColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
        carRepairLabel.backgroundColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
        
        exterior.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        exandinBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        detailBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        oilChangeBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        tireBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        examBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
