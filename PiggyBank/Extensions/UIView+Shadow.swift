//
//  UIView+Shadow.swift
//  PiggyBank
//
//  Created by Allison Yuan on 1/3/21.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
}
