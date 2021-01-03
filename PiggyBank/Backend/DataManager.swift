//
//  FirebaseConnector.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import Firebase

class DataManager {
    
    private let ref: DatabaseReference!
    private let userID: String!
    
    var historyData = [HistoryData]()
    var goalData = [GoalData]()
    
    static let shared = DataManager()
    
    init() {
        ref = Database.database().reference()
        
        if let id = UserDefaults.standard.value(forKey: "userID") as? String {
            userID = id
        } else {
            if let key = ref.child("users").childByAutoId().key {
                ref.child("users").child(key).setValue(key)
                UserDefaults.standard.setValue(key, forKey: "userID")
                userID = key
            } else {
                userID = "No Working Key"
            }
        }
        addTotal()
        NotificationCenter.default.post(name: NotificationNames.historyDataLoaded.notification, object: nil)
    }
    
    func getId() -> String {
        return userID
    }
    
    func getHistoryData() {
        ref.child("history").child(userID).observe(.value) { [weak self] (snapshot) in
            self?.historyData = [HistoryData]()
            
            guard let data = snapshot.value as? [String : Any] else {
                return
            }
            
            for (historyID, value) in data {
                let value = value as! [String: Any]
                
                let startTime = Date(timeIntervalSince1970: TimeInterval(value["startTime"] as! Double))
                let adCount = value["adCount"] as! Int
                let timeLength = value["length"] as! Int
                let goalID = value["goalID"] as! String
                
                let historyItem = HistoryData(historyID: historyID, date: startTime, length: timeLength, goalID: goalID, adCount: adCount)
                
                self?.historyData.append(historyItem)
            }
            self?.updateGoalTotal()
            self?.sortHistoryData()
            NotificationCenter.default.post(name: NotificationNames.historyDataLoaded.notification, object: nil)
        }
    }
    
    func getGoalData() {
        ref.child("goals").child(userID).observe(.value) { [weak self] (snapshot) in
            self?.goalData = [GoalData]()
            
            guard let data = snapshot.value as? [String: Any] else {
                return
            }
            
            for (goalID, value) in data {
                let value = value as! [String: Any]
                
                let name = value["name"] as! String
                let progress = value["progress"] as! Int
                let goal = value["goal"] as! Int
                let color = value["color"] as! String
                
                let goalItem = GoalData(goalID: goalID, color: Appearance.PigColors(rawValue: color)!, name: name, progress: progress, goal: goal)
                
                self?.goalData.append(goalItem)
            }
            self?.sortGoals()
            self?.sortHistoryData()
            self?.addTotal()
            NotificationCenter.default.post(name: NotificationNames.goalDataLoaded.notification, object: nil)

        }
    }
    
    func addHistoryItem(startTime: Date, timeLength: Int, adCount: Int, goalIndex: Int) {
        if let key = ref.child("history").child(userID).childByAutoId().key {
            let hData = HistoryData(historyID: key, date: startTime, length: timeLength, goalID: goalData[goalIndex].goalID, adCount: adCount)
            ref.child("history").child(userID).child(key).setValue(hData.getDictRepresentation())
            historyData.append(hData)
            goalData[goalIndex].progress += timeLength
            if goalData[goalIndex].goalID != "total" {
                ref.child("goals").child(userID).child(goalData[goalIndex].goalID).child("progress").setValue(goalData[goalIndex].progress)
            }
        } else {
            print("Could not add history data")
        }
    }
    
    func addGoalData(name: String, progress: Int, goal: Int, color: Appearance.PigColors) {
        if let key = ref.child("goals").child(userID).childByAutoId().key {
            let gData = GoalData(goalID: key, color: color, name: name, progress: progress, goal:  goal)
            ref.child("goals").child(userID).child(key).setValue(gData.getDictRepresentation())
            goalData.append(gData)
        }
    }

    func sortHistoryData() {
        if historyData.count <= 1 {
            return
        }
        
        for i in 0..<historyData.count - 1 {
            var maxDate = Double(historyData[i].date.timeIntervalSince1970)
            var maxIndex = 0
            for j in i..<historyData.count {
                if Double(historyData[j].date.timeIntervalSince1970) > maxDate {
                    maxDate = Double(historyData[j].date.timeIntervalSince1970)
                    maxIndex = j
                }
            }
            
            let temp = historyData[i]
            historyData[i] = historyData[maxIndex]
            historyData[maxIndex] = temp
        }
    }
    
    func sortGoals() {
        if goalData.count <= 1 {
            return
        }
        
        let start = goalData[0].name == "total" ? 1 : 0
        
        if start == 1 && goalData.count == 2 {
            return
        }
        
        for i in start..<goalData.count - 1 {
            var maxIndex = i
            var name = goalData[i].name
            for j in i+1..<goalData.count {
                if goalData[j].name > name {
                    name = goalData[j].name
                    maxIndex = j
                }
            }
            
            let temp = goalData[i]
            goalData[i] = goalData[maxIndex]
            goalData[maxIndex] = temp
        }
        
    }
    
    func addTotal() {
        var totalTime = 0
        for i in historyData {
            if i.goalID == "total" {
                totalTime += i.length
            }
        }
        
        let totalGoal = GoalData(goalID: "total", color: Appearance.TOTAL_GOAL_COLOR, name: "Total", progress: totalTime, goal: 0)
        goalData.insert(totalGoal, at: 0)
    }
    
    func updateGoalTotal() {
        var totalTime = 0
        for i in historyData {
            totalTime += i.length
        }
        goalData[0].progress = totalTime
        
        
        
    }
    
    func getGoalName(of id: String) -> String{
        for i in 0..<goalData.count {
            if goalData[i].goalID == id {
                return goalData[i].name
            }
        }
        return ""
    }
    
    func emptyGoalName(of index: Int) {
        let id = goalData[index].goalID
        goalData[index].progress = 0
        ref.child("goals").child(userID).child(id).child("progress").setValue(0)
        
        for i in 0..<historyData.count {
            if historyData[i].goalID == id {
                ref.child("history").child(userID).child(historyData[i].historyID).child("goalID").setValue("total")
            }
        }
        
        
    }
    
    
}
