//
//  GoalData.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/1/21.
//

import Foundation
class GoalData {
    
    var goalID: String
    var color: Appearance.PigColors
    var name: String
    var progress: Int
    var goal: Int
    
    init(goalID: String, color: Appearance.PigColors, name: String, progress: Int, goal: Int) {
        self.goalID = goalID
        self.color = color
        self.name = name
        self.progress = progress
        self.goal = goal
    }
    
    func getDictRepresentation() -> [String: Any] {
        let dict = ["name": name,
                    "progress": progress,
                    "goal": goal,
                    "color": color.rawValue] as [String: Any]
        return dict as [String: Any]
    }
}
