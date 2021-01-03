//
//  ViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import UIKit

class ViewController: UIViewController, SliderDelegate {
    
    let slider = Slider()
    let piggyImage = UIImageView()
    
    let time = UILabel()
    let start = UIButton()
    let empty = UIButton()

    var seconds = 300
    var timer = Timer()
    var isTimerRunning = false
    var isStartEnabled = true
    
    
    let menuButton: UIButton = {
        let mView = UIButton()
        for i in 0..<3 {
            let topBar = UIView(frame: CGRect(x: 0, y: i*9, width: 30, height: 4))
            topBar.layer.cornerRadius = 2
            topBar.backgroundColor = UIColor.white
            mView.addSubview(topBar)
        }
        return mView
    }()
    
    let titleLabel = UILabel()
    
    
    
    weak var currentGoal: GoalData?
    
    override func viewDidLoad() {
        self.view.backgroundColor = Appearance.Colors.backgroundColor
        
        
        self.view.addSubview(menuButton)
        menuButton.constrain(to: self.view, topInset: 60, leadingInset: 30)
        menuButton.constrain(width: 30, height: 22)
        menuButton.addTarget(self, action: #selector(handleMenuPressed), for: .touchUpInside)
        
        self.view.addSubview(titleLabel)
        titleLabel.font = Appearance.Fonts.mainTitle
        titleLabel.constrain(to: self.view, topInset: 60, leadingInset: 40, trailingInset: -40)
        titleLabel.textAlignment = .center
        titleLabel.constrain(height: 41)
        
        
        self.view.addSubview(slider)
        slider.constrain(width: 20, height: 250)
        slider.constrain(to: self.view, centerYInset: 0, centerXInset: 0)
        slider.layoutIfNeeded()
        slider.moveSliderToBottom()
        slider.delegate = self
        
        slider.setSliderColor(to: UIColor.black)
    }
    
    @objc func handleMenuPressed() {
        NotificationCenter.default.post(name: NotificationNames.toggleSideBar.notification, object: nil)
    }
    
    
    
    @objc func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            isTimerRunning = false
            restartTimer()
        } else {
            seconds -= 1
//            time.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func restartTimer() {
        //getSliderValue(slider)
    }
    
    func changeGoal() {
        
    }
    
    func getSliderPosition(proportion: Double) {
     //   print(proportion)
    }
}
