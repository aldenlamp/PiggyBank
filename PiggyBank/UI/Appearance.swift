//
//  Appearance.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit


class Appearance {
    

    enum PigColors: String, CaseIterable {
        case pink = "pink"
        case red = "red"
        case orange = "orange"
        case yellow = "yellow"
        case green = "green"
        case blue = "blue"
        case purple = "purple"
    }
    
    static let TABLE_CELL_HEIGHT: CGFloat = 125
    static let SIDEBAR_WIDTH: CGFloat = 240
    static let OVERLAY_FULL_OPACITY : CGFloat = 0.5
    static let SIDEBAR_SHADOW_OPACITY: Float = 0.7
    static let SIDEBAR_ANIMATION_DURATION = 0.3
    
    static let TOTAL_GOAL_COLOR = PigColors.pink
    
    enum Colors {
        
        static let backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
    }
    
    enum Font {
        static let contentTitle = UIFont.systemFont(ofSize: 22, weight: .regular)
        static let goalTitle = UIFont.systemFont(ofSize: 30, weight: .regular)
    }
    
}
