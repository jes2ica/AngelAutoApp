//
//  SidePanelViewController.swift
//  AngelAuto
//
//  Created by Yijie Zhuang on 6/24/15.
//  Copyright (c) 2015 angel. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class SidePanelViewController: UIViewController, PayPalPaymentDelegate, PFLogInViewControllerDelegate {
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    
    @IBOutlet var carWashLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var detailBtn: UIButton!
    @IBOutlet var surpriceBtn: UIButton!
    @IBOutlet var promotionsBtn: UIButton!
    @IBOutlet var oilChangeBtn: UIButton!
    @IBOutlet var tireBtn: UIButton!
    @IBOutlet var examBtn: UIButton!
    @IBOutlet var historyButton: UIButton!
    @IBOutlet var aboutBtn: UIButton!
    
    var resultText = ""
    
    var payPalConfig = PayPalConfiguration()
    
    var acceptCreditCards: Bool = true {
        didSet {
            payPalConfig.acceptCreditCards = acceptCreditCards
        }
    }
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnectWithEnvironment(newEnvironment)
            }
        }
    }
    
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
        surpriceBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        promotionsBtn.backgroundColor = UIColor(red: 115/255, green: 197/255, blue: 236/255, alpha: 1)
        
        var img = UIImage(named: "cp3_round.png")    //初始化图片
        var vImg = UIImageView(image: img);   //初始化图片View
        vImg.frame = CGRect(x:25,y:60,width:80,height:80);   //指定图片的位置以及显示的大小
        self.view.addSubview(vImg);
        //显示在View上
        
        // Set up payPalConfig
        payPalConfig.acceptCreditCards = acceptCreditCards;
        payPalConfig.merchantName = "Awesome Shirts, Inc."
        payPalConfig.merchantPrivacyPolicyURL = NSURL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = NSURL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        
        payPalConfig.languageOrLocale = NSLocale.preferredLanguages()[0] as! String
        payPalConfig.payPalShippingAddressOption = .PayPal;
        println("PayPal iOS SDK Version: \(PayPalMobile.libraryVersion())")
        
        var requestParameters = ["fields": "email, first_name, last_name"]
        let userDetails = FBSDKGraphRequest(graphPath: "me", parameters: requestParameters)
        
        
        let myUser:PFUser = PFUser.currentUser()!
        println(myUser)
        // Show personal information
        userDetails.startWithCompletionHandler { (connection, result, error:NSError!) -> Void in
            
            if(error != nil) {
                println("\(error.localizedDescription)")
                return
            }
            
            if(result != nil) {
                
                let userFirstName:String? = result["first_name"] as? String
                let userLastName:String? = result["last_name"] as? String
                let userEmail:String? = result["email"] as? String
                
                let myUser:PFUser = PFUser.currentUser()!
                var userName:String! = userFirstName! + " " + userLastName!
                self.nameLabel.text = userName
                
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        PayPalMobile.preconnectWithEnvironment(environment)
    }
    
    
    @IBAction func paymentBtnPressed(sender: AnyObject) {
        
        resultText = ""
        
        // Optional: include multiple items
        var item1 = PayPalItem(name: "Old jeans with holes", withQuantity: 2, withPrice: NSDecimalNumber(string: "84.99"), withCurrency: "USD", withSku: "Hip-0037")
        var item2 = PayPalItem(name: "Free rainbow patch", withQuantity: 1, withPrice: NSDecimalNumber(string: "0.00"), withCurrency: "USD", withSku: "Hip-00066")
        var item3 = PayPalItem(name: "Long-sleeve plaid shirt (mustache not included)", withQuantity: 1, withPrice: NSDecimalNumber(string: "37.99"), withCurrency: "USD", withSku: "Hip-00291")
        
        let items = [item1, item2, item3]
        let subtotal = PayPalItem.totalPriceForItems(items)
        
        // Optional: include payment details
        let shipping = NSDecimalNumber(string: "5.99")
        let tax = NSDecimalNumber(string: "2.50")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.decimalNumberByAdding(shipping).decimalNumberByAdding(tax)
        
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Hipster Clothing", intent: .Sale)
        
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if (payment.processable) {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            presentViewController(paymentViewController, animated: true, completion: nil)
        }
        else {
            // This particular payment will always be processable. If, for
            // example, the amount was negative or the shortDescription was
            // empty, this payment wouldn't be processable, and you'd want
            // to handle that here.
            println("Payment not processalbe: \(payment)")
        }
        
        
    }
    
    @IBAction func historyPressed(sender: AnyObject) {
//        let historyViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HistoryViewController") as! UIViewController
//        
//        self.presentViewController(historyViewController, animated: true, completion: nil)

        
    }
    
    
    @IBAction func aboutUsPressed(sender: AnyObject) {
//        let aboutUsViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AboutUsViewController") as! UIViewController
//        
//        self.presentViewController(aboutUsViewController, animated: true, completion: nil)

        
    }
    

    @IBAction func settingsPressed(sender: AnyObject) {
        
        let settingsViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SettingsViewController") as! UIViewController
        
        self.presentViewController(settingsViewController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func logoutPressed(sender: AnyObject) {
        
        PFUser.logOutInBackgroundWithBlock{(error: NSError?) -> Void in
            
//            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! UIViewController
//            self.presentViewController(viewController, animated: true, completion: nil)
            
            let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            let viewControllerNav = UINavigationController(rootViewController: viewController)
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewControllerNav
            
            
        }
    }
    
    @IBAction func editPressed(sender: AnyObject) {
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
        let viewControllerNav = UINavigationController(rootViewController: viewController)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewControllerNav

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController!, didCompletePayment completedPayment: PayPalPayment!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
