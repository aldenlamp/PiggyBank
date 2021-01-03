//
//  GoalView.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit

class GoalTableViewCell: UITableViewCell {
    
    // variables
    let piggyImage = UIImageView()
    let container = UIView()
    let goalName = UILabel()
    let progressNumberLabel = UILabel()
    let progressBar = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createGoal()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createGoal() {
        piggyImage.image = UIImage(named: "piggyBank") 
        
        self.backgroundColor = Appearance.Colors.backgroundColor
        
        //adding image and container to goal
        self.addSubview(piggyImage)
        piggyImage.constrain(width: 85, height: 85)
        piggyImage.constrain(to: self, leadingInset: 20, centerYInset: 0)
        self.addSubview(container)
        container.constrain(to: self, topInset: 0, bottomInset: 0, trailingInset: 0, centerYInset: 0)
        container.constrain(against: piggyImage, leadingInset: 0)
        
        //adding labels to container
        container.addSubview(goalName)
        goalName.constrain(to: container, topInset: 0, leadingInset: 0)
        container.addSubview(progressNumberLabel)
        progressNumberLabel.constrain(to: container, topInset: 0, trailingInset: 0)
        progressNumberLabel.constrain(width: 90)
        container.addSubview(progressBar)
        progressBar.constrain(to: container, bottomInset: 0, leadingInset: 0, trailingInset: 0);
        
        progressBar.constrain(against: goalName, topInset: 0)
        goalName.constrain(against: progressNumberLabel, trailingInset: 0)
        
        //text settings
        goalName.textAlignment = .center
        progressNumberLabel.textAlignment = .center
        //goalName.sizeToFit()
        goalName.font = goalName.font.withSize(30)
        progressNumberLabel.font = goalName.font.withSize(30)
        goalName.adjustsFontSizeToFitWidth = true
        goalName.minimumScaleFactor = 0.5

        goalName.constrain(to: progressNumberLabel, heightInset: 0)
        goalName.constrain(to: progressBar, heightInset: 0)
    }
    
    func updateData(with data: GoalData) {
        goalName.text = data.name
        progressNumberLabel.text = "\(data.progress)/\(data.goal)"
        //progressBar.text = data.progress
        switch data.color {
        case .pink:
            piggyImage.image = UIImage(named: "pinkPig")
        case .red:
            piggyImage.image = UIImage(named: "redPig")
        case .orange:
            piggyImage.image = UIImage(named: "orangePig")
        case .yellow:
            piggyImage.image = UIImage(named: "yellowPig")
        case .green:
            piggyImage.image = UIImage(named: "greenPig")
        case .blue:
            piggyImage.image = UIImage(named: "bluePig")
        case .purple:
            piggyImage.image = UIImage(named: "purplePig")
        }
    }
    
    
}
