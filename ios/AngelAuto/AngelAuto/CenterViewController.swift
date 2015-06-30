//
//  CenterViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/23/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit
import GoogleMaps


@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
    
    var delegate: CenterViewControllerDelegate?
    
    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 280, 20))
    
    
    @IBOutlet var navigationBar: UINavigationItem!
    @IBAction func menuBtnPressed(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        var camera = GMSCameraPosition.cameraWithLatitude(37.39, longitude: -122.06, zoom: 9)
        var mapView = GMSMapView.mapWithFrame(CGRectMake(0, 60, 375 ,800), camera: camera)
        
        view.addSubview(mapView)
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        
        searchBar.placeholder = "Location"
        var rightNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        
    }
    
}
