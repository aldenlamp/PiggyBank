//
//  ViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    let piggyImage = UIImageView()
    let slider = UISlider()
    
    let time = UILabel()
    let start = UIButton()
    
    let top = UIView()
    let middle = UIView()
    let bottom = UIView()
    
    var seconds = 300
    var timer = Timer()
    var isTimerRunning = false
    var isStartEnabled = true
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        
        
        let test = ProgressBar()
        
        self.view.addSubview(test)
        test.constrain(to: self.view, leadingInset: 20, trailingInset: -20, centerYInset: 0, centerXInset: 0)
        test.constrain(height: 50)
        test.setProgress(to: 10, outOf: 100)
        test.setForgroundColor(to: UIColor.green, withBackground: UIColor.blue )
        
        let test2 = ProgressBar()
        self.view.addSubview(test2)
        test2.constrain(to: self.view, leadingInset: 20, trailingInset: -20, centerXInset: 0)
        test2.constrain(against: test, topInset: 40)
        test2.constrain(height: 100)
        test2.setProgress(to: 70, outOf: 100)
        test2.setForgroundColor(to: UIColor.green, withBackground: UIColor.blue)
   
        test2.roundCornerRadius()
        
        print("\n\n\(test2.goalView.frame.height)\n\n")
        
        
//        self.view.addSubview(time)
//        time.constrain(to: self.view, centerYInset: 0, centerXInset: 0)
//        time.constrain(width: 200, height: 100)
//        time.text = "hello"
//        time.textAlignment = .center
//
//        self.view.addSubview(start)
//        start.constrain(to: self.view, centerXInset: 0)
//        start.constrain(against: time, topInset: 0)
//        start.constrain(width: 100, height: 30)
//        start.setTitle("start", for: .normal)
//        start.setTitleColor(UIColor.black, for: .normal)
//        start.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        /*
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(top)
        top.constrain(to: self.view, topInset: 0, leadingInset: 0, trailingInset: 0)
        self.view.addSubview(middle)
        middle.constrain(to: self.view, leadingInset: 0, trailingInset: 0)
        self.view.addSubview(bottom)
        bottom.constrain(to: self.view, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        top.constrain(against: middle, bottomInset: 0)
        middle.constrain(against: bottom, bottomInset: 0)
        top.constrain(to: middle, heightInset: 0)
        top.constrain(to: bottom, heightInset: 0)
        
        middle.addSubview(piggyImage)
        piggyImage.image = UIImage(named: "pinkPig")
        piggyImage.widthAnchor.constraint(equalTo: piggyImage.heightAnchor, constant: 0).isActive = true
        piggyImage.constrain(to: middle, centerXInset: 0)
        middle.addSubview(slider)
        slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        slider.constrain(to: middle, leadingInset: 0, trailingInset: 0)
        slider.constrain(against: piggyImage, topInset: 10)
        slider.widthAnchor.constraint(equalTo: piggyImage.heightAnchor, constant: 0).isActive = true
        slider.constrain(height: 30)
        
        slider.minimumValue = 0
        slider.maximumValue = 24
        slider.isContinuous = true
        */
    }
    @objc func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            isTimerRunning = false
            restartTimer()
        } else {
            seconds -= 1
            time.text = timeString(time: TimeInterval(seconds))
        }
    }
    func restartTimer() {
        //getSliderValue(slider)
    }
}
