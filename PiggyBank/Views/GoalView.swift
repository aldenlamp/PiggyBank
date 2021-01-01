//
//  GoalView.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit

class GoalView: UIView {
    
    // Varbales
    let piggyImage = UIImageView()
    let container = UIView()
    let goalName = UILabel()
    let progressNumberLabel = UILabel()
    let progressBar = UILabel()
    
    init() {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createGoal() {
        self.constrain(height: 100)
        self.backgroundColor = UIColor.white
        self.addSubview(piggyImage)
        self.addSubview(container)
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
        progressNumberLabel.constrain(to: goalName, heightInset: 0)
        
        goalName.constrain(to: container, topInset: 0, leadingInset: 0)
        goalName.constrain(to: progressNumberLabel, trailingInset: 0)
        progressNumberLabel.constrain(to: container, topInset: 0, trailingInset: 0)
        progressBar.constrain(to: container, bottomInset: 0, leadingInset: 0, trailingInset: 0);
    }
    
//    func updateData(with data: CustomDataObject) {
//
//    }
    
    
}
