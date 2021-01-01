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

    override func viewDidLoad() {
        super.viewDidLoad()
        //contain.addSubview(goal)
        //goal.createGoal()
        
        self.view.addSubview(piggyImage)
        self.view.addSubview(container)
        container.addSubview(goalName)
        container.addSubview(progressNumberLabel)
        container.addSubview(progressBar)
        
        piggyImage.backgroundColor = UIColor.green;
        goalName.backgroundColor = UIColor.red;
        progressNumberLabel.backgroundColor = UIColor.yellow;
        progressBar.backgroundColor = UIColor.blue;
        
        //piggyImage.constrain(to: self, topInset: 0, bottomInset: 0, leadingInset: 0, centerYInset: 0)
        piggyImage.constrain(to: container, widthInset: 0)
        goalName.textAlignment = .center
        progressNumberLabel.textAlignment = .center
        //container.constrain(to: self, topInset: 0, bottomInset: 0, trailingInset: 0, centerYInset: 0)
        container.constrain(to: piggyImage, leadingInset: 10)
        
        //constraining widths and heights
        goalName.constrain(to: progressNumberLabel, widthInset: 0)
        goalName.constrain(to: progressBar, heightInset: 0)
        progressNumberLabel.constrain(to: progressBar, heightInset: 0)
        
        goalName.constrain(to: container, topInset: 0, leadingInset: 0)
        goalName.constrain(to: progressNumberLabel, trailingInset: 0)
        progressNumberLabel.constrain(to: container, topInset: 0, trailingInset: 0)
        progressBar.constrain(to: container, bottomInset: 0, leadingInset: 0, trailingInset: 0);
    
    }
 */
}

