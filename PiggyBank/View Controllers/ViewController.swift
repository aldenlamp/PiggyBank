//
//  ViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLable = UILabel()
    
    
    let container = UIView()
    
    let start = UIButton()
    let pause = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        self.view.addSubview(titleLable)
        titleLable.text = "Hello World"
        titleLable.textAlignment = .center
        titleLable.constrain(height: 20)
        titleLable.constrain(to: self.view, leadingInset: 20, trailingInset: -20, centerYInset: 0, centerXInset: 0)
//        titleLable.backgroundColor = UIColor.blue
        
        
        
        container.addSubview(start)
        container.addSubview(pause)
        
        
        self.view.addSubview(start)
        self.view.addSubview(pause)
        
        start.setTitle("start", for: .normal)
        pause.setTitle("pause", for: .normal)
        
        start.constrain(against: pause, trailingInset: -50)
        start.constrain(to: pause, widthInset: 0)
        start.constrain(to: self.view, leadingInset: 50, centerYInset: 0)
        start.constrain(height: 30)
        start.backgroundColor = UIColor.blue
        
        pause.constrain(to: self.view, trailingInset: -50, centerYInset: 0)
        pause.constrain(height: 30)
        pause.backgroundColor = UIColor.red
        
        
        
        
        
    }


}

