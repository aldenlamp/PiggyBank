//
//  SidebarViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit

class SidebarViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let buttonData = NavigationDataSource.shared.getSidebarData()
        
        
        for i in 0..<buttonData.count {
            
            let button = UIButton()
            button.setTitle(buttonData[i].title, for: .normal)

            self.view.addSubview(button)
            button.constrain(to: self.view, topInset: CGFloat(70 + i * 70), centerXInset: 0)
            button.constrain(width: Appearance.SIDEBAR_WIDTH - 40, height: 40)

            button.tag = i
            button.addTarget(self, action: #selector(handleButtonClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    @objc func handleButtonClicked(sender: UIButton) {
        NotificationCenter.default.post(name: NotificationNames.switchScreen.notification, object: nil, userInfo: ["Screen": sender.tag])
    }
    
}
