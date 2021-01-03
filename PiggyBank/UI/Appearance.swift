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
    
    static let PIGTIME_PADDING: CGFloat = 75
    
    static let TOTAL_GOAL_COLOR = PigColors.pink
    
    enum Colors {
        static let backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
        static let borderColor = UIColor(hex: "#707070")
        static let lightBlue = UIColor(hex: "#A4BBFA")
        static let darkBlue = UIColor(hex: "#335FB4")
    }
    
    enum Fonts {
        static let mainTitle = UIFont.systemFont(ofSize: 40, weight: .bold)
        static let contentTitle = UIFont.systemFont(ofSize: 22, weight: .regular)
        static let goalTitle = UIFont.systemFont(ofSize: 35, weight: .regular)
        static let timerLabelFont = UIFont.systemFont(ofSize: 25, weight: .medium)
        static let addGoalMinute = UIFont.systemFont(ofSize: 25, weight: .regular)
        static let goalFont = UIFont.systemFont(ofSize: 30, weight: .regular)
        static let sidebarFont = UIFont.systemFont(ofSize: 25, weight: .regular)
    }
    
    static func getImage(for color: PigColors) -> UIImage {
        switch (color) {
        case .pink:
            return UIImage(named: "pinkPig")!
        case .red:
            return UIImage(named: "redPig")!
        case .orange:
            return UIImage(named: "orangePig")!
        case .yellow:
            return UIImage(named: "yellowPig")!
        case .green:
            return UIImage(named: "greenPig")!
        case .blue:
            return UIImage(named: "bluePig")!
        case .purple:
            return UIImage(named: "purplePig")!
        }
    }
    
}
