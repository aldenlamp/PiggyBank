//
//  HistoryViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var list = [HistoryData]()
    
    let tableView = UITableView()
    let topBar = UIView()
    let barLine = UIView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        self.view.addSubview(tableView)
        self.view.addSubview(topBar)
        self.view.addSubview(barLine)
        barLine.backgroundColor = UIColor.black
        
        topBar.constrain(height: 100)
        barLine.constrain(height: 1)
        
        topBar.constrain(to: self.view, topInset: 0, leadingInset: 0, trailingInset: 0)
        barLine.constrain(to: self.view, leadingInset: 0, trailingInset: 0)
        barLine.constrain(against: topBar, topInset: 0)
        tableView.constrain(against: barLine, topInset: 0)
        tableView.constrain(to: self.view, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        
//        list.append(HistoryData(coinValue: 5, dayDate: "Wed, 12/20", time: "11:30", goal: "Biology"))
//        list.append(HistoryData(coinValue: 5, dayDate: "Wed, 12/20", time: "11:30", goal: "Biology"))
//        list.append(HistoryData(coinValue: 5, dayDate: "Wed, 12/20", time: "11:30", goal: "Biology"))
//        list.append(HistoryData(coinValue: 5, dayDate: "Wed, 12/20", time: "11:30", goal: "Biology"))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Appearance.TABLE_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! HistoryTableViewCell
        cell.updateData(with: list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
}
    
    
    
    /*
    var list = [GoalData]()

    let tableView = UITableView()
    let topBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        self.view.addSubview(tableView)
        self.view.addSubview(topBar)
        topBar.backgroundColor = UIColor.blue
        topBar.constrain(height: 75)
        topBar.constrain(to: self.view, topInset: 0, leadingInset: 0, trailingInset: 0)
        tableView.constrain(against: topBar, topInset: 0)
        tableView.constrain(to: self.view, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        
        list.append(GoalData(color: .blue, name: "hi", progress: 1, goal: 10))
        list.append(GoalData(color: .blue, name: "hi", progress: 1, goal: 10))
        list.append(GoalData(color: .blue, name: "hi", progress: 1, goal: 10))
        list.append(GoalData(color: .blue, name: "hi", progress: 1, goal: 10))
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Appearance.TABLE_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! HistoryTableViewCell
        cell.updateData(with: list[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count

    }
 
}
 */
