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
    var piggyImage = UIImageView()
    let container = UIView()
    let goalName = UILabel()
    let progressNumberLabel = UILabel()
    let progressBar = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createGoal()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createGoal()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createGoal() {
        piggyImage.image = UIImage(named: "piggyBank")
        
//        self.constrain(height: 100)
        self.backgroundColor = UIColor.white
        
        //adding image and container to goal
        self.addSubview(piggyImage)
        piggyImage.constrain(width: 100)
        piggyImage.constrain(to: self, topInset: 0, bottomInset: 0, leadingInset: 0, centerYInset: 0)
        self.addSubview(container)
        container.constrain(to: self, topInset: 0, bottomInset: 0, trailingInset: 0, centerYInset: 0)
        container.constrain(against: piggyImage, leadingInset: 0)
        
        //adding labels to container
        container.addSubview(goalName)
        goalName.text = "Biology"
        goalName.constrain(to: container, topInset: 0, leadingInset: 0)
        container.addSubview(progressNumberLabel)
        progressNumberLabel.text = "5/10"
        progressNumberLabel.constrain(to: container, topInset: 0, trailingInset: 0)
        container.addSubview(progressBar)
        progressBar.constrain(to: container, bottomInset: 0, leadingInset: 0, trailingInset: 0);
        
        progressBar.constrain(against: goalName, topInset: 0)
        goalName.constrain(against: progressNumberLabel, trailingInset: 0)
        
        goalName.textAlignment = .center
        progressNumberLabel.textAlignment = .center
        
        //constraining widths and heights
        goalName.constrain(to: progressNumberLabel, widthInset: 0)
        goalName.constrain(to: progressNumberLabel, heightInset: 0)
        goalName.constrain(to: progressBar, heightInset: 0)
    }
    
    func updateData(with data: GoalData) {
        goalName.text = "asdf"
        progressNumberLabel.text = "1/10"
        progressBar.text = "..."
        piggyImage.image = UIImage(named: "piggyBank")
    }
    
    
}
