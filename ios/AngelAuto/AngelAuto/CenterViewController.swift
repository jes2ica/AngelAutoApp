//
//  CenterViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/23/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation


@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController, CLLocationManagerDelegate {
    
    var delegate: CenterViewControllerDelegate?
    
    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 280, 20))
    let locationManager = CLLocationManager()
    var didFindMyLocation = false
    
    var latitude : String!
    var longitude : String!
    
    var mapView:GMSMapView!
    
    @IBOutlet var navigationBar: UINavigationItem!
    @IBAction func menuBtnPressed(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    @IBOutlet var acceptBtn: UIButton!
    @IBOutlet var refuseBtn: UIButton!
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        self.view.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:Selector("viewTapped:"))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        var camera = GMSCameraPosition.cameraWithLatitude(37.39, longitude: -122.06, zoom: 9)
        mapView = GMSMapView.mapWithFrame(CGRectMake(0, 60, 375 ,460), camera: camera)
//
//        var marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(37.39, -122.06)
//        marker.title = "San Jose"
//        marker.snippet = "USA"
//        marker.icon = UIImage(named:"marker_green.png")
//        marker.map = mapView
//        
//        
//        var marker2 = GMSMarker()
//        marker2.position = CLLocationCoordinate2DMake(37.37, -122.16)
//        marker2.title = "San Jose"
//        marker2.snippet = "USA"
//        marker2.icon = UIImage(named:"marker_blue.png")
//        marker2.map = mapView
//
//        var path = GMSMutablePath()
//        path.addCoordinate(CLLocationCoordinate2DMake(37.39, -122.06))
//        path.addCoordinate(CLLocationCoordinate2DMake(37.38, -122.08))
//        path.addCoordinate(CLLocationCoordinate2DMake(37.37, -122.16))
//        var polyline = GMSPolyline(path: path)
//        polyline.map = mapView
//        polyline.strokeColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
//        polyline.strokeWidth = 3;
        
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        
        searchBar.placeholder = "Location"
        var rightNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        
        refuseBtn.layer.cornerRadius = 20
        acceptBtn.layer.cornerRadius = 20
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.New, context: nil)
        view.addSubview(mapView)
        
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            mapView.myLocationEnabled = true
        }
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if !didFindMyLocation {
            let myLocation: CLLocation = change[NSKeyValueChangeNewKey] as! CLLocation
            mapView.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 10.0)
            mapView.settings.myLocationButton = true
            didFindMyLocation = true
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func viewTapped(tap: UITapGestureRecognizer) {
        self.searchBar.resignFirstResponder()
    }
    
    
    
}
