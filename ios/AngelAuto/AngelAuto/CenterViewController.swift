//
//  CenterViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/23/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
    
    var delegate: CenterViewControllerDelegate?
    
    @IBAction func menuBtnPressed(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
}
