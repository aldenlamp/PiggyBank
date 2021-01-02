//
//  Appearance.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit


class Appearance {
    
    enum PigColors: String {
        case green = "green"
        case blue = "blue"
        case red = "red"
        case yellow = "yellow"
        case orange = "orange"
        case purple = "purple"
        case pink = "pink"
    }
    
    static let TABLE_CELL_HEIGHT: CGFloat = 150
    static let SIDEBAR_WIDTH: CGFloat = 240
    static let OVERLAY_FULL_OPACITY : CGFloat = 0.5
    static let SIDEBAR_SHADOW_OPACITY: Float = 0.7
    static let SIDEBAR_ANIMATION_DURATION = 0.3
    
    enum Font {
        static let contentTitle = UIFont.systemFont(ofSize: 22, weight: .regular)
    }
    
}
