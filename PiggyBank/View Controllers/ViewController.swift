//
//  ViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import UIKit

class ViewController: UIViewController {
    //let goal = GoalView()
    
    
    let label = UILabel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        label.text = "Hello World"
        label.backgroundColor = UIColor.green
        self.view.addSubview(label)
        
        label.constrain(to: self.view, centerYInset: 0, centerXInset: 0)
        label.constrain(width: 100, height: 20)
        label.textAlignment = .center
    }
}
