//
//  GoalViewController.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/1/21.
//

import Foundation
import UIKit

class GoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    let goal = GoalView()
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        /*
        super.viewDidLoad()
        self.view.addSubview(goal)
        goal.constrain(to: self.view, leadingInset: 0, trailingInset: 0, centerYInset: 0, centerXInset: 0)
        goal.createGoal()
        */
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as! GoalTableViewCell
        cell.createGoal()
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

