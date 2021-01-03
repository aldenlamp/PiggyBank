//
//  SidebarButton.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/3/21.
//

import Foundation
import UIKit

class SidebarButton: UIButton {
    let icon = UIImageView()
    let pageName = UILabel()
    
    func addButton(named name: String) {
        self.backgroundColor = Appearance.Colors.lightBlue
        self.addSubview(icon)
        self.addSubview(pageName)
        icon.image = UIImage(named: name)
        icon.constrain(width: 40)
        icon.constrain(to: self, topInset: 0, bottomInset: 0, leadingInset: 0)
        pageName.text = name
        pageName.textAlignment = .left
        pageName.textColor = .white
        pageName.font = Appearance.Fonts.sidebarFont
        pageName.constrain(to: self, topInset: 0, bottomInset: 0, trailingInset: 0)
        pageName.constrain(against: icon, leadingInset: 0)
    }
}
