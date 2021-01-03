//
//  UIButton+OnClick.swift
//  PiggyBank
//
//  Created by Allison Yuan on 1/3/21.
//

import Foundation
import UIKit

extension UIButton {
    
    func addClickShadow() {
        self.addTarget(self, action: #selector(touchDownShadow), for: .touchDown)
        self.addTarget(self, action: #selector(touchUpShadow), for: .touchUpInside)
        self.addTarget(self, action: #selector(touchUpShadow), for: .touchUpOutside)
    }
    
    @objc func touchDownShadow() {
        self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.7)
    }
    
    @objc func touchUpShadow() {
        self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
    }
    
}
