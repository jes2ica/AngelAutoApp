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
    
    @IBOutlet var detailBtn: UIButton!
    
    
    @IBOutlet var oilChangeBtn: UIButton!
    @IBOutlet var tireBtn: UIButton!
    @IBOutlet var examBtn: UIButton!
    
    @IBOutlet var historyButton: UIButton!
    
    @IBOutlet var aboutBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.image = UIImage(named: "menu_bg.jpg")
        image2.image = UIImage(named:"menu_bg.png")
        
        detailBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        oilChangeBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        tireBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        examBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        historyButton.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        aboutBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        
        var img = UIImage(named: "cp3_round.png")    //初始化图片
        var vImg = UIImageView(image: img);   //初始化图片View
//        vImg.frame.origin = CGPoint(x:0,y:50);   //指定图片显示的位置
        vImg.frame = CGRect(x:20,y:20,width:80,height:80);   //指定图片的位置以及显示的大小
//        vImg.frame = CGRectMake((self.view.bounds.size.width-100)/2, (self.view.bounds.size.height-100)/2, 100, 100)
        self.view.addSubview(vImg);   //显示在View上
//        vImg.layer.cornerRadius = 20;
//        vImg.layer.masksToBounds = true;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
