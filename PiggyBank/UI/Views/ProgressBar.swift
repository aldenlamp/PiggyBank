//
//  ProgressBar.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/2/21.
//

import Foundation
import UIKit

class ProgressBar: UIView {
    
    private let progressTitleLabel = UILabel()
    private let goalTitleLabel = UILabel()
    
    private let goalView = UIView()
    private let progressView = UIView()
    private let progressLabel = UILabel()
    private let goalLabel = UILabel()
    
    
    
    var shouldShowTitle = true {
        didSet {
            progressTitleLabel.isHidden = !shouldShowTitle
            progressTitleLabelHeightClosed?.isActive = !shouldShowTitle
            progressTitleLabelHeightOpen?.isActive = shouldShowTitle
        }
    }
    
    var shouldShowLabels = true {
        didSet {
            progressLabel.isHidden = !shouldShowLabels
            goalLabel.isHidden = !shouldShowLabels
        }
    }
    
    private var progressWidth: NSLayoutConstraint?
    private var progressTitleLabelHeightOpen: NSLayoutConstraint?
    private var progressTitleLabelHeightClosed: NSLayoutConstraint?
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(progressTitleLabel)
        progressTitleLabel.constrain(to: self, topInset: 0, leadingInset: Appearance.PROGRESSBAR_TITLE_PADDING)
        progressTitleLabelHeightOpen = progressTitleLabel.heightAnchor.constraint(equalToConstant: 24 )
        progressTitleLabelHeightClosed = progressTitleLabel.heightAnchor.constraint(equalToConstant: 0)
        progressTitleLabel.text = "Progress"
        progressTitleLabel.textAlignment = .left
        progressTitleLabelHeightOpen?.isActive = true
        progressTitleLabel.textColor = UIColor.white
        progressTitleLabel.font = Appearance.Fonts.progressTitleFont
        
        self.addSubview(goalTitleLabel)
        goalTitleLabel.constrain(to: self, topInset: 0, trailingInset: -Appearance.PROGRESSBAR_TITLE_PADDING)
        goalTitleLabel.constrain(against: progressTitleLabel, leadingInset: 0)
        goalTitleLabel.constrain(to: progressTitleLabel, widthInset: 0, heightInset: 0)
        goalTitleLabel.text = "Goal"
        goalTitleLabel.textAlignment = .right
        goalTitleLabel.textColor = UIColor.white
        goalTitleLabel.font = Appearance.Fonts.progressTitleFont
        
        
        self.addSubview(goalView)
        goalView.constrain(to: self, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        goalView.constrain(against: progressTitleLabel, topInset: 5)
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
        
        progressWidth = progressView.widthAnchor.constraint(equalTo: goalView.widthAnchor, multiplier: goal == 0 ? 1 : CGFloat(progress)/CGFloat(goal))    
        progressWidth?.isActive = true
        
        progressLabel.text = "\(progress)"
        goalLabel.text = "\(goal)"
        
        layoutIfNeeded()
        
        if progressLabel.frame.contains(CGPoint(x: goalLabel.frame.minX, y: goalLabel.frame.midY)) {
            shouldShowLabels = false
        }
        
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
