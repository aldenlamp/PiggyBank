//
//  ProgressBar.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/2/21.
//

import Foundation
import UIKit

class ProgressBar: UIView {
    
    let titleLabel = UILabel()
    
    let goalView = UIView()
    let progressView = UIView()
    let progressLabel = UILabel()
    let goalLabel = UILabel()
    
    var progress = 0
    var goal = 0
    
    var shouldShowTitle = true {
        didSet {
            titleLabel.isHidden = !shouldShowTitle
        }
    }
    
    var shouldShowLabels = true {
        didSet {
            progressLabel.isHidden = !shouldShowLabels
            goalLabel.isHidden = !shouldShowLabels
        }
    }
    
    var progressWidth: NSLayoutConstraint?
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(titleLabel)
        titleLabel.constrain(to: self, topInset: 0, leadingInset: 0, trailingInset: 0)
        titleLabel.constrain(height: 20)
        titleLabel.text = "Progress"
        
        self.addSubview(goalView)
        goalView.constrain(to: self, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        goalView.constrain(against: titleLabel, topInset: 5)
        goalView.backgroundColor = UIColor.white
        
        goalView.addSubview(progressView)
        progressView.constrain(to: goalView, topInset: 0, bottomInset: 0, leadingInset: 0)
        progressView.backgroundColor = UIColor.white
        
        goalView.addSubview(goalLabel)
        goalLabel.constrain(to: goalView, topInset: 0, bottomInset: 0, trailingInset: -10)
        goalLabel.constrain(width: 40)
        goalLabel.textAlignment = .right
        
        progressView.addSubview(progressLabel)
        progressLabel.constrain(to: progressView, topInset: 0, bottomInset: 0, trailingInset: -10)
        progressLabel.constrain(width: 40)
        progressLabel.textAlignment = .right
        

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProgress(to progress: Int, outOf goal: Int) {
        progressWidth?.isActive = false
        progressWidth = progressView.widthAnchor.constraint(equalTo: goalView.widthAnchor, multiplier: CGFloat(progress)/CGFloat(goal))
        progressWidth?.isActive = true
        
        progressLabel.text = "\(progress)"
        goalLabel.text = "\(goal)"
    }
    
    func setForgroundColor(to color: UIColor, withBackground bColor: UIColor = UIColor.white) {
        progressView.backgroundColor = color
        goalView.backgroundColor = bColor
    }
    
    func roundCornerRadius() {
        self.layoutIfNeeded()
        progressView.layer.masksToBounds = true
        goalView.layer.masksToBounds = true
        progressView.layer.cornerRadius = progressView.frame.height / 2
        goalView.layer.cornerRadius = goalView.frame.height / 2
    }
    
    
    
    
}
