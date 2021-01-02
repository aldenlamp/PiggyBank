//
//  GoalViewController.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/1/21.
//

import Foundation
import UIKit

class GoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = [GoalData]()
    let addGoalVC = AddGoalViewController()

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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Appearance.TABLE_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! GoalTableViewCell
        cell.updateData(with: list[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count

    }
    @objc func switchToAdd() {
        present(addGoalVC, animated: true, completion: nil)
    }
}

