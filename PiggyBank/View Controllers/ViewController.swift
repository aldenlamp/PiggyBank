//
//  ViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import UIKit

class ViewController: UIViewController {
    let goal = GoalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(goal)
        goal.constrain(to: self.view, leadingInset: 0, trailingInset: 0, centerYInset: 0, centerXInset: 0)
        goal.createGoal()
    }
}

