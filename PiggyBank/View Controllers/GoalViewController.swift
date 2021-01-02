//
//  GoalViewController.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/1/21.
//

import Foundation
import UIKit

class GoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddGoalVCDelegate {
    
//    var list = [GoalData]()
    var addGoalVC = AddGoalViewController()

    let tableView = UITableView()
    let topBar = UIView()
    let addButton = UIButton()
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
        
        topBar.addSubview(addButton)
        addButton.constrain(width: 50, height: 50)
        addButton.constrain(to: topBar, bottomInset: 0, trailingInset: -10)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font =  UIFont(name: "Arial", size: 50)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.addTarget(self, action: #selector(switchToAdd), for: .touchUpInside)
        
        topBar.constrain(to: self.view, topInset: 0, leadingInset: 0, trailingInset: 0)
        barLine.constrain(to: self.view, leadingInset: 0, trailingInset: 0)
        barLine.constrain(against: topBar, topInset: 0)
        tableView.constrain(against: barLine, topInset: 0)
        tableView.constrain(to: self.view, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        tableView.register(GoalTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
//        list.append(GoalData(color: .blue, name: "hi", progress: 1, goal: 10))
//        list.append(GoalData(color: .blue, name: "hi", progress: 1, goal: 10))
//        list.append(GoalData(color: .blue, name: "hi", progress: 1, goal: 10))
//        list.append(GoalData(color: .blue, name: "hi", progress: 1, goal: 10))
    
        addGoalVC.delegate = self
        
        NotificationCenter.default.addObserver(forName: NotificationNames.goalDataLoaded.notification, object: nil, queue: nil, using: reloadData(notification:))
    }
    
    @objc func reloadData(notification: Notification? = nil) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Appearance.TABLE_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! GoalTableViewCell
        cell.updateData(with: DataManager.shared.goalData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.goalData.count
    }
    @objc func switchToAdd() {
        present(addGoalVC, animated: true, completion: nil)
    }
    
    func getNewGoalData(name: String, color: Appearance.PigColors, goal: Int, progress: Int) {
        DataManager.shared.addGoalData(name: name, progress: progress, goal: goal, color: color)
    }
    
//    func getNewGoalData() {
//        let actualColor: Appearance.PigColors
//        let name = addGoalVC.nameTextField.text!
//        let progress = 0
//        let goal = Int(addGoalVC.goalTextField.text!)!
//        switch addGoalVC.color {
//        case "pink":
//            actualColor = .pink
//        case "red":
//            actualColor = .red
//        case "orange":
//            actualColor = .orange
//        case "yellow":
//            actualColor = .yellow
//        case "green":
//            actualColor = .green
//        case "blue":
//            actualColor = .blue
//        case "purple":
//            actualColor = .purple
//        default:
//            actualColor = .pink
//        }
//        list.append(GoalData(color: actualColor, name: name, progress: progress, goal: goal))
//        addGoalVC = AddGoalViewController()
//    }
}

