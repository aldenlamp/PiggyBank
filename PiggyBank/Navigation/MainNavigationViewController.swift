//
//  MainNavigationViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit


class MainNavigationController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        isNavigationBarHidden = true
        NotificationCenter.default.addObserver(forName: NotificationNames.switchScreen.notification, object: nil, queue: nil, using: handleSwitchToScreen(notification:))
    }
    
    private func handleSwitchToScreen(notification: Notification) {
        guard let screenNum = notification.userInfo?["screen"] as? Int else {
            return
        }
        switchToScreen(num: screenNum)
    }
    
    func switchToScreen(num index: Int) {
        let dest = [NavigationDataSource.shared.getSidebarData()[index].destination]
        setViewControllers(dest, animated: false)
    }
    
    
    
}
