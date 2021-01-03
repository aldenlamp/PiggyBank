//
//  UIColor+Init.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/2/21.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String = "#000000") {
        var str = ""
        if hex.count == 7 {
            guard String(hex.prefix(1)) == "#" else {
                self.init(red: 0, green: 0, blue: 0, alpha: 1)
                return
            }
            str = String(hex.suffix(1))
        }
        guard hex.count == 6 else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        str = hex
        
        let start = str.index(str.startIndex, offsetBy: 2)
        let mid1 = str.index(str.startIndex, offsetBy: 2)
        let mid2 = str.index(str.startIndex, offsetBy: 4)
        let end = str.index(str.startIndex, offsetBy: 6)

        var rStr = String(str[start..<mid1])
        var gStr = String(str[mid1..<mid2])
        var bStr = String(str[mid2..<end])
        
        guard let red = UInt(rStr, radix: 16), let green = UInt(gStr, radix: 16), let blue = UInt(bStr, radix: 16) else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1)
    }
    
    
}
