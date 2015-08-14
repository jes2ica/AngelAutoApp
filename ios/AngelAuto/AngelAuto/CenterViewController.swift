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
import Parse
import YRADScrollView

@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate, GMSMapViewDelegate, YRADScrollViewDataSource, YRADScrollViewDelegate, FancyTabBarDelegate {
    
    @IBOutlet var mapView: GMSMapView!
    var delegate: CenterViewControllerDelegate?
    
    var nameArray:[String]!
    
    let locationManager = CLLocationManager()
    var didFindMyLocation = false
    
    var searchBar:UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 280, 20))
    
    @IBOutlet var navigationBar: UINavigationItem!
    @IBAction func menuBtnPressed(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    var backgroundView : UIImageView!
    var fancyTabBar : FancyTabBar!
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        searchBar.placeholder = "Location"
        var rightNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        
        nameArray = []
        for index in 0...2 {
            let name = String(format: "Page %d", index + 1)
            nameArray.append(name)
        }
        
        var image : UIImage = UIImage(named:"cat")!
        
        let adScrollView = YRADScrollView(frame:CGRectMake(0, 250, self.view.frame.size.width, 150))
        adScrollView.dataSource = self
        adScrollView.delegate = self
//        self.view.addSubview(adScrollView)
        
        
        self.fancyTabBar = FancyTabBar(frame: self.view.bounds)
        self.fancyTabBar.setUpChoices(self, choices: ["wash", "repair", "maintenance", "diagnosis"], withMainButtonImage: UIImage(named: "main_button"))
        self.fancyTabBar.delegate = self
//        self.view.addSubview(self.fancyTabBar)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.delegate = self
        
        if !didFindMyLocation {
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
            didFindMyLocation = true
        }
        
        showCarServices()
    }
    
    func showCarServices() {
        var query = PFQuery(className:"AutoCompany")
        
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects {
                    for object in objects {
                        var street = object.objectForKey("address")?.objectForKey("street") as! String
                        var address = "616 S Amphlett Blvd, San Mateo, CA 94402"
                        var geocoder = CLGeocoder()
                        
                        // Show marker based on address
                        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error)->Void in
                            if error == nil {
                                
                                var placemark = placemarks[0] as? CLPlacemark
                                var location = placemark?.location
                                var coordinate = location?.coordinate
                                
                                var marker = GMSMarker(position: coordinate!)
                                marker.title = "Ren Motors"
                                marker.map = self.mapView
                                marker.icon = UIImage(named: "marker_blue")
                            }
                        })

                        
                        
                    }
                    
                }
            }
        })
    }
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        marker.icon = UIImage(named: "marker_yellow")
        
        var alert = UIAlertController(title: "Message", message: "Waiting for the service provider...", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        return true
    }
    
    func didCollapse() {
        
        UIView.animateWithDuration(0.3, animations: {
            self.backgroundView.alpha = 0;
            }, completion: {(finished: Bool) in
                if(finished) {
                    self.backgroundView.removeFromSuperview()
                    self.backgroundView = nil
                }
        })
    }
    
    func didExpand() {
        if(self.backgroundView == nil) {
            self.backgroundView = UIImageView(frame: self.view.bounds)
            self.backgroundView.alpha = 0
            self.view.addSubview(self.backgroundView)
        }
        
        UIView.animateWithDuration(0.3, animations: {
            self.backgroundView.alpha = 1;
            }, completion: {(finished: Bool) in}
        )
        self.view.bringSubviewToFront(self.fancyTabBar)
        
        var backgroundImage:UIImage = self.view.convertViewToImage()
        var tintColor:UIColor = UIColor(white: 1.0, alpha: 0.5)
        var image:UIImage = backgroundImage.applyBlurWithRadius(10, tintColor: tintColor, saturationDeltaFactor: 1.8, maskImage: nil)
        backgroundView.image = image
    }
    
    func optionsButton(optionButton: UIButton!, didSelectItem index: Int32) {
        print("Hello index %d tapped!", index)
        if (index == 1) {
            let mapViewController = MapViewController()
            self.presentViewController(mapViewController, animated: true, completion: nil)
            
        }
    }
    
    func viewForYRADScrollView(adScrollView: YRADScrollView!, atPage pageIndex: Int) -> UIView! {
        var label = adScrollView.dequeueReusableView() as? UILabel
        
        if label == nil {
            label = UILabel()
        }
        label?.text = nameArray[pageIndex]
        label?.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        return label
    }
    
    func numberOfViewsForYRADScrollView(adScrollView: YRADScrollView!) -> UInt {
        return UInt(nameArray.count)    
    }
    
    
    func adScrollView(adScrollView: YRADScrollView!, didClickedAtPage pageIndex: Int) {
        println("clicked: " + nameArray[pageIndex])
    }
    
    func adScrollView(adScrollView: YRADScrollView!, didScrollToPage pageIndex: Int) {
        println("has shown : " + nameArray[pageIndex])
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
            
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 10 , bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func viewTapped(tap: UITapGestureRecognizer) {
        self.view.endEditing(true)
        self.mapView.endEditing(true)
        self.searchBar.endEditing(true)
        println("tappped")
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        searchBar.showsCancelButton = true
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: false)
        searchBar.resignFirstResponder()
        return false
    }
    
    
}
