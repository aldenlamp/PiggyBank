//
//  HistoryData.swift
//  PiggyBank
//
//  Created by Allison Yuan on 1/2/21.
//

import Foundation

class HistoryData {
    
    var historyID: String
    var date: Date
    var length: Int
    var goalID: String
    var adCount: Int
    
    init(historyID: String, date: Date, length: Int, goalID: String, adCount: Int) {
        self.historyID = historyID
        self.date = date
        self.length = length
        self.goalID = goalID
        self.adCount = adCount
    }
    
    func getDictRepresentation() -> [String: Any] {
        let data = ["startTime": date.timeIntervalSince1970,
                    "adCount" : adCount,
                    "length" : length,
                    "goalID": goalID] as [String : Any]
        
        return data as [String : Any]
    }
}
