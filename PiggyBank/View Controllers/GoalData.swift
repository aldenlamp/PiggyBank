//
//  GoalData.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/1/21.
//

import Foundation
class GoalData {
    enum Colors {
        case green
        case blue
        case red
        case yellow
        case orange
        case purple
        case pink
    }
    
    private var color: Colors = .pink
    private var name: String = ""
    private var progress: Int = 0
    private var goal: Int = 0
    
    func setData(color: Colors, name: String, progress: Int, goal: Int) {
        self.color = color
        self.name = name
        self.progress = progress
        self.goal = goal
    }
    func getColor() -> Colors{
        return color
    }
    func getName() -> String {
        return name
    }
    func getProgress() -> Int {
        return progress
    }
    func getGoal() -> Int {
        return goal
    }
}
