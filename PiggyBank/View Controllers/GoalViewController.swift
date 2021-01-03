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
    let topLabel = UILabel()
    let menuButton: UIButton = {
        let mView = UIButton()
        for i in 0..<3 {
            let topBar = UIView(frame: CGRect(x: 0, y: i*9, width: 30, height: 4))
            topBar.layer.cornerRadius = 2
            topBar.backgroundColor = UIColor.white
            mView.addSubview(topBar)
        }
        mView.constrain(width: 30, height: 22)
        return mView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        self.view.addSubview(tableView)
        self.view.addSubview(topBar)
        tableView.backgroundColor = Appearance.Colors.backgroundColor
        topBar.backgroundColor = Appearance.Colors.lightBlue

        topBar.constrain(height: 100)
        
        topBar.addSubview(topLabel)
        topLabel.text = "My Piggy Banks"
        topLabel.textColor = .white
        topLabel.constrain(to: topBar, bottomInset: -10, leadingInset: 0, trailingInset: 0, centerXInset: 0)
        topLabel.font = Appearance.Fonts.goalTitle
        topLabel.textAlignment = .center

        topLabel.constrain(height: 45)
        
        topBar.addSubview(addButton)
        addButton.constrain(width: 50, height: 50)
        addButton.constrain(to: topBar, trailingInset: -20)
        addButton.constrain(to: topLabel, centerYInset: 0)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font =  UIFont(name: "Arial", size: 50)
        addButton.setTitleColor(UIColor.white, for: .normal)
        addButton.addTarget(self, action: #selector(switchToAdd), for: .touchUpInside)
        
        topBar.addSubview(menuButton)
        menuButton.constrain(to: topBar, topInset: 60, leadingInset: 30)
        menuButton.constrain(width: 30, height: 22)
        menuButton.addTarget(self, action: #selector(handleMenuPressed), for: .touchUpInside)
        
        topBar.constrain(to: self.view, topInset: 0, leadingInset: 0, trailingInset: 0)
        tableView.constrain(against: topBar, topInset: 0)
        tableView.constrain(to: self.view, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        tableView.register(GoalTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
    
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

    
    @objc func handleMenuPressed() {
        NotificationCenter.default.post(name: NotificationNames.toggleSideBar.notification, object: nil)
    }
}

