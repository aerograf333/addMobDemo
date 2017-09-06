//
//  ViewController.swift
//  addMobDemo
//
//  Created by Rkhorenko on 9/4/17.
//  Copyright © 2017 Rkhorenko. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds


class ViewController: UIViewController, UIAlertViewDelegate, GADBannerViewDelegate {

 
    @IBOutlet weak var bannerView: GADBannerView!
  
    var interstitial: GADInterstitial!
    
    @IBAction func displayAdd(_ sender: Any) {
        if interstitial.isReady{
            interstitial.present(fromRootViewController: self)
        } else {
            print("Add wosn't ready")
        
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("GoggleMobileAds SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(GADRequest())
        
         let  requst = GADRequest()
       
         interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        requst.testDevices = [kGADSimulatorID, "12FF8F4C-0CB1-4CCB-B380-605D052C970A" ]
        interstitial.load(requst)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

