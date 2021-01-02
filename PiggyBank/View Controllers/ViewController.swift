//
//  ViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADRewardedAdDelegate {

    
    let testButton = UIButton()
    var ad = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        testButton.setTitle("Click for add", for: .normal)
        testButton.backgroundColor = UIColor.blue
        testButton.titleLabel?.textAlignment = .center
        self.view.addSubview(testButton)
        
        testButton.constrain(to: self.view, leadingInset: 20, trailingInset: -20, centerYInset: 0, centerXInset: 0)
        testButton.constrain(height: 30)
        testButton.addTarget(self, action: #selector(launchAdd), for: .touchUpInside)
        
        ad.load(GADRequest(), completionHandler: nil)
    }
    
    @objc func launchAdd() {
        if ad.isReady {
            ad.present(fromRootViewController: self, delegate: self)
            
        }
    }
    
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        print("ASDFASDFASDF: \(reward.type) \(reward.amount)")
        self.dismiss(animated: true, completion: nil)
        reloadAd()
    }
    
    func reloadAd() {
        ad = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
        ad.load(GADRequest(), completionHandler: nil)
    }
}
