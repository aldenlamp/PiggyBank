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
    }
    
    func deleteData() {
        UserDefaults.standard.removeObject(forKey: "userID")
    }
    
    func getId() -> String {
        return userID
    }
    

    
    
    
}
