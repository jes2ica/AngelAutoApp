//
//  MapViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/23/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
        override func viewDidLoad() {
        
        super.viewDidLoad()
            

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

// MARK: CenterViewController delegate

extension MapViewController: CenterViewControllerDelegate {
    
    func toggleLeftPanel() {
    }
    
    func toggleRightPanel() {
    }
    
    func addLeftPanelViewController() {
    }
    
    func addRightPanelViewController() {
    }
    
    func animateLeftPanel(#shouldExpand: Bool) {
    }
    
    func animateRightPanel(#shouldExpand: Bool) {
    }
    
}
