//
//  HistoryData.swift
//  PiggyBank
//
//  Created by Allison Yuan on 1/2/21.
//

import Foundation
class HistoryData {
    var coinValue: Int
    var dayDate: String
    var time: String
    var goal: String
    
    init(coinValue: Int, dayDate: String, time: String, goal: String) {
        self.coinValue = coinValue
        self.dayDate = dayDate
        self.time = time
        self.goal = goal
    }
}
