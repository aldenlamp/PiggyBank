//
//  ProgressBar.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/2/21.
//

import Foundation
import UIKit

class ProgressBar: UIView {
    
    
    let goalView = UIView()
    let progressView = UIView()
    let progressLabel = UILabel()
    let goalLabel = UILabel()
    
    var progress = 0
    var goal = 1
    
    var shouldShowLabels = true
    var goalColor: UIColor?
    var progressColor: UIColor?
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(goalView)
        goalView.constrain(to: self, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        self.addSubview(progressView)
        progressView.constrain(to: self, bottomInset: 0, leadingInset: 0)
        progressView.constrain(to: goalView, heightInset: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProgress(to progress: Int, outOf goal: Int) {
        
    }
    
    
    
    
    
}
