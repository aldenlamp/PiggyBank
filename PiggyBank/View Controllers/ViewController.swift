//
//  ViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, SliderDelegate, selectGoalDelegate, GADRewardedAdDelegate {
    
    let MAX_MINUTES: Int = 120
    
    let menuButton: UIButton = {
        let mView = UIButton()
        for i in 0..<3 {
            let topBar = UIView(frame: CGRect(x: 0, y: i*9, width: 30, height: 4))
            topBar.layer.cornerRadius = 2
            topBar.backgroundColor = UIColor.white
            topBar.isUserInteractionEnabled = false
            mView.addSubview(topBar)
        }
        mView.constrain(width: 30, height: 22)
        return mView
    }()
    
    let titleLabel = UILabel()
    
    let slider = Slider()
    let pigTimer = PigTimer()
    
    let progressBar = ProgressBar()
    
    var goalIndex: Int = 0
    
    var startTime: Date = Date()
    var minutes: Int = 0
    var adCount: Int = 0
    
    var isTimerRunning = false
    
    var seconds = 0
    var timer = Timer()
    var adTimer = Timer()
    
    var adIsRunning = false
    var ad = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
    
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
        
        NotificationCenter.default.addObserver(forName: NotificationNames.goalDataLoaded.notification, object: nil, queue: nil, using: goalDataLoaded(notification: ))
        NotificationCenter.default.addObserver(forName: NotificationNames.historyDataLoaded.notification, object: nil, queue: nil, using: goalDataLoaded(notification: ))
        
        updateData()
        
        
        ad.load(GADRequest(), completionHandler: nil)
        
    }
    
    @objc func goalDataLoaded(notification: Notification) {
        updateData()
    }
    
    @objc func handleMenuPressed() {
        NotificationCenter.default.post(name: NotificationNames.toggleSideBar.notification, object: nil)
    }
    
    @objc func handleSwitchBanks() {
        let goalView = GoalViewController()
        goalView.isSelection = true
        goalView.delegate = self
        self.present(goalView, animated: true, completion: nil)
    }
    
    @objc func handleStart() {
        startTimer()
    }
    
    @objc func handleEmpty() {
        DataManager.shared.emptyGoalName(of: goalIndex)
    }
    
    func goalSelected(with index: Int) {
        goalIndex = index
        updateData()
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateData() {
        if DataManager.shared.goalData.count <= goalIndex {
            return
        }
        
        let data = DataManager.shared.goalData[goalIndex]
        
        self.titleLabel.text = data.name
        self.progressBar.setProgress(to: data.progress, outOf: data.goal)
        self.pigTimer.pigColor = data.color
        
        if goalIndex == 0 {
            emptyButton.isUserInteractionEnabled = false
            emptyButton.backgroundColor = emptyButton.backgroundColor?.withAlphaComponent(0.5)
        } else {
            emptyButton.isUserInteractionEnabled = true
            emptyButton.backgroundColor = emptyButton.backgroundColor?.withAlphaComponent(1)
        }
    }
    
    @objc func startTimer() {
        isTimerRunning = true
        startTime = Date()
        seconds = minutes * 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        startButton.backgroundColor = startButton.backgroundColor?.withAlphaComponent(0.5)
        startButton.isUserInteractionEnabled = false
        emptyButton.backgroundColor = emptyButton.backgroundColor?.withAlphaComponent(0.5)
        emptyButton.isUserInteractionEnabled = false
        switchBanksButton.backgroundColor = switchBanksButton.backgroundColor?.withAlphaComponent(0.5)
        switchBanksButton.isUserInteractionEnabled = false
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            isTimerRunning = false
            DataManager.shared.addHistoryItem(startTime: startTime, timeLength: minutes, adCount: adCount, goalIndex: goalIndex)
            
            minutes = 0
            pigTimer.updateTimer(with: minutes)
            slider.moveSliderToBottom()
            
            startButton.backgroundColor = startButton.backgroundColor?.withAlphaComponent(1)
            startButton.isUserInteractionEnabled = true
            emptyButton.backgroundColor = emptyButton.backgroundColor?.withAlphaComponent(1)
            emptyButton.isUserInteractionEnabled = true
            switchBanksButton.backgroundColor = switchBanksButton.backgroundColor?.withAlphaComponent(1)
            switchBanksButton.isUserInteractionEnabled = true
            
            if adIsRunning {
                adIsRunning = false
                dismiss(animated: true, completion: nil)
                ad = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
                ad.load(GADRequest(), completionHandler: nil)
                adTimer.invalidate()
            }
            
        } else {
            seconds -= 1
            if seconds >= 60*60 {
                pigTimer.updateTimer(with: seconds * 60)
            } else {
                pigTimer.updateTimer(with: seconds)
            }
            
        }
        
        if ad.isReady && !adIsRunning{
            adIsRunning = true
            ad.present(fromRootViewController: self, delegate: self)
            adTimer = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(updateAdTimer), userInfo: nil, repeats: false)
            wasRewarded = false
        }
        
    }
    
    @objc func updateAdTimer() {
        if wasRewarded{
            adTimer.invalidate()
            dismiss(animated: true, completion: nil)
            adIsRunning = false
            ad = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
            ad.load(GADRequest(), completionHandler: nil)
        } else {
            adTimer = Timer.scheduledTimer(timeInterval: 16, target: self, selector: #selector(updateAdTimer), userInfo: nil, repeats: false)
        }
    }
    
    var wasRewarded = false
    
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        adCount += 1
        wasRewarded = true
    }
    
    func getSliderPosition(proportion: Double) {
        let min = Int(proportion * Double(MAX_MINUTES))
        minutes = min
        pigTimer.updateTimer(with: min)
    }
}
