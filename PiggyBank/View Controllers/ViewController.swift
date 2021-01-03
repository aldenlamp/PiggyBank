//
//  ViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import UIKit

class ViewController: UIViewController, SliderDelegate {
    
    
    let time = UILabel()
//    let start = UIButton()
//    let empty = UIButton()

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
        mView.constrain(width: 30, height: 22)
        return mView
    }()
    
    let titleLabel = UILabel()
    
    let slider = Slider()
    let pigTimer = PigTimer()
    
    let progressBar = ProgressBar()
    
    let switchBanksButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Appearance.Colors.darkBlue
        button.titleLabel?.font = Appearance.Fonts.switchBanksButton
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Switch Banks", for: .normal)
        button.constrain(width: 220, height: 46)
        button.layer.cornerRadius = 23
        button.addShadow()
        return button
    }()
    
    var startButton: UIButton = UIButton()
    var emptyButton: UIButton = UIButton()
    
    func createCircleButton () -> UIButton {
        let button = UIButton()
        button.backgroundColor = Appearance.Colors.lightBlue
        button.constrain(width: 90, height: 90)
        button.layer.cornerRadius = 45
        button.titleLabel?.font = Appearance.Fonts.switchBanksButton
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }
    
    weak var currentGoal: GoalData?
    
    override func viewDidLoad() {
        self.view.backgroundColor = Appearance.Colors.backgroundColor
        
        self.view.addSubview(menuButton)
        menuButton.constrain(to: self.view, topInset: 60, leadingInset: 30)
        menuButton.constrain(width: 30, height: 22)
        menuButton.addTarget(self, action: #selector(handleMenuPressed), for: .touchUpInside)
        
        self.view.addSubview(titleLabel)
        titleLabel.font = Appearance.Fonts.mainTitle
        titleLabel.constrain(to: self.view, topInset: 120, leadingInset: 40, trailingInset: -40)
        titleLabel.textAlignment = .center
        titleLabel.constrain(height: 41)
        titleLabel.text = "Hello World"
        titleLabel.textColor = .white
        
        self.view.addSubview(pigTimer)
        pigTimer.heightAnchor.constraint(equalTo: pigTimer.widthAnchor).isActive = true
        pigTimer.constrain(to: self.view, leadingInset: Appearance.PIGTIME_PADDING, trailingInset: -Appearance.PIGTIME_PADDING)
        pigTimer.constrain(against: titleLabel, topInset: 5)
        pigTimer.updateTimer(with: 0)
        pigTimer.pigColor = .pink
        
        self.view.addSubview(slider)
        slider.constrain(to: pigTimer, topInset: 0, bottomInset: 0)
        slider.constrain(against: pigTimer, leadingInset: 15)
        slider.constrain(width: 20)
        slider.layoutIfNeeded()
        slider.moveSliderToBottom()
        slider.delegate = self
        
        slider.setSliderColor(to: Appearance.Colors.lightBlue)
        slider.setBackgroundColor(to: UIColor.white)
        
        self.view.addSubview(progressBar)
        progressBar.constrain(to: self.view, centerXInset: 0)
        progressBar.constrain(to: slider, trailingInset: -10)
        progressBar.constrain(against: pigTimer, topInset: 20)
        progressBar.constrain(height: 60)
        progressBar.layoutIfNeeded()
        progressBar.roundCornerRadius()
        progressBar.setForgroundColor(to: Appearance.Colors.lightBlue, withBackground: UIColor.white)
        progressBar.layoutIfNeeded()
        progressBar.setProgress(to: 99, outOf: 100)
        
        self.view.addSubview(switchBanksButton)
        switchBanksButton.constrain(to: self.view, centerXInset: 0)
        switchBanksButton.constrain(against: progressBar, topInset: 30)
        switchBanksButton.addTarget(self, action: #selector(handleSwitchBanks), for: .touchUpInside)
        switchBanksButton.addClickShadow()
        
        startButton = createCircleButton()
        emptyButton = createCircleButton()
        
        self.view.addSubview(startButton)
        self.view.addSubview(emptyButton)
        
        startButton.constrain(against: switchBanksButton, topInset: 30)
        startButton.constrain(to: self.view, leadingInset: 75)
        startButton.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        startButton.setTitle("Start", for: .normal)
        startButton.addShadow()
        startButton.addClickShadow()
        
        emptyButton.constrain(to: self.view, trailingInset: -75)
        emptyButton.constrain(against: switchBanksButton, topInset: 30)
        emptyButton.addTarget(self, action: #selector(handleEmpty), for: .touchUpInside)
        emptyButton.setTitle("Empty", for: .normal)
        emptyButton.addShadow()
        emptyButton.addClickShadow()
    }
    
    @objc func handleMenuPressed() {
        NotificationCenter.default.post(name: NotificationNames.toggleSideBar.notification, object: nil)
    }
    
    @objc func handleSwitchBanks() {
        
    }
    
    @objc func handleStart() {
        
    }
    
    @objc func handleEmpty() {
        
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
