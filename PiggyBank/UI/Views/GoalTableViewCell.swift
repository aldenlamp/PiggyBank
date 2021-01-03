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
    let progressBar = ProgressBar()
    
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
        container.constrain(to: self, trailingInset: -20, centerYInset: 0)
        container.constrain(to: piggyImage, topInset: 0, bottomInset: 0)
        container.constrain(against: piggyImage, leadingInset: 0)
        
        //adding labels to container
        container.addSubview(goalName)
        container.addSubview(progressNumberLabel)
        container.addSubview(progressBar)
        
        goalName.constrain(to: container, topInset: 0, leadingInset: 0)
        goalName.constrain(against: progressNumberLabel, trailingInset: -10)
        
        progressNumberLabel.constrain(to: container, topInset: 0, trailingInset: 0)
        progressNumberLabel.constrain(width: 85)
        
        progressBar.constrain(to: container, bottomInset: 0, leadingInset: 0, trailingInset: 0);
        progressBar.setForgroundColor(to: Appearance.Colors.lightBlue, withBackground: UIColor.white)
        progressBar.shouldShowTitle = false
        progressBar.shouldShowLabels = false

        //text settings
        goalName.textAlignment = .left
        goalName.textColor = .white
        progressNumberLabel.textAlignment = .center
        progressNumberLabel.textColor = .white
        //goalName.sizeToFit()
        goalName.font = Appearance.Fonts.goalFont
        progressNumberLabel.font = Appearance.Fonts.goalFont
    }
    
    func updateData(with data: GoalData) {
        goalName.text = data.name
        progressNumberLabel.text = "\(data.progress)/\(data.goal)"
        progressBar.setProgress(to: data.progress, outOf: data.goal)
        progressBar.roundCornerRadius()
        piggyImage.image = Appearance.getImage(for: data.color)
    }
}
