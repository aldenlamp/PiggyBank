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
         
        
        
//        self.view.addSubview(titleLable)
//        titleLable.backgroundColor = UIColor.red

//        titleLable.constrain(to: self.view, leadingInset: 20, trailingInset: -20, centerYInset: 0, centerXInset: 0)
//        titleLable.backgroundColor = UIColor.blue
        

    }
    /*
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(label)
        label.text = "Hello World"
    }
 */
    /*
    let piggyImage = UIImageView()
    let container = UIView()
    let goalName = UILabel()
    let progressNumberLabel = UILabel()
    let progressBar = UILabel()

=======
    let goal = GoalView()
    
>>>>>>> bc0189822cdd2cd106aa78a3f1101f8192a6b4cd
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(goal)
        goal.constrain(to: self.view, leadingInset: 0, trailingInset: 0, centerYInset: 0, centerXInset: 0)
        goal.createGoal()
    }
}

