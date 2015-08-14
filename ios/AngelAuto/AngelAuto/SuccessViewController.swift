//
//  SuccessViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 7/8/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation


class SuccessViewController: UIViewController, CLLocationManagerDelegate {
    
    var successNavigationController: UINavigationController!
    var successViewController: SuccessViewController!
    
    var mapView:GMSMapView!
    
    @IBOutlet var cancelBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        successViewController = UIStoryboard.successViewController()
        successNavigationController = UINavigationController(rootViewController: successViewController)
        successNavigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        var camera = GMSCameraPosition.cameraWithLatitude(37.39, longitude: -122.06, zoom: 9)
        mapView = GMSMapView.mapWithFrame(CGRectMake(0, 60, 375 ,530), camera: camera)
        
        cancelBtn.layer.cornerRadius = 20
        
        view.addSubview(mapView)
        
        
        var b = UIBarButtonItem(title: "back", style: .Plain, target: self, action: "sayHello:")
        self.navigationItem.leftBarButtonItem = b
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sayHello(sender: UIBarButtonItem) {
        let mapViewController = MapViewController()
        self.presentViewController(mapViewController, animated: true, completion: nil)

        
        
    }
    
    
    
    
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func successViewController() -> SuccessViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("SuccessViewController") as? SuccessViewController
    }
    
}

