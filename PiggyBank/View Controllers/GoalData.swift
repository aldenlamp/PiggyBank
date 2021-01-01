//
//  GoalData.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/1/21.
//

import Foundation
class GoalData {
    var color: Appearance.PigColors
    var name: String
    var progress: Int
    var goal: Int
    
    init(color: Appearance.PigColors, name: String, progress: Int, goal: Int) {
        self.color = color
        self.name = name
        self.progress = progress
        self.goal = goal
    }
}
