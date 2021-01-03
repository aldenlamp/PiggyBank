//
//  HistoryTableViewCell.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/1/21.
//

import Foundation
import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    // variables
    let coinImage = UIImageView()
    let date = UILabel()
    let goalName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createHistoryCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createHistoryCell() {
        // instead of piggyBank should be coinImage
        coinImage.image = UIImage(named: "coin")
        
        // self.constrain(height: 100)
        self.backgroundColor = UIColor.white
        
        // adding image, date and goal
        self.addSubview(coinImage)
        let padding: CGFloat = 15
        coinImage.constrain(to: self, topInset: padding, bottomInset: -padding, leadingInset: padding)
        coinImage.widthAnchor.constraint(equalTo: coinImage.heightAnchor).isActive = true
        
        // adding goal name
        self.addSubview(goalName)
        self.addSubview(date)
        
        goalName.constrain(to: self, bottomInset: 0, trailingInset: 0)
        goalName.constrain(against: date, topInset: 0)
        
        date.constrain(to: goalName, heightInset: 0)
        date.constrain(to: self, topInset: 0, trailingInset: 0)
        date.constrain(against: coinImage, leadingInset: 0)
        date.constrain(against: goalName, bottomInset: 0)
        
        
        
        date.textAlignment = .center
        goalName.textAlignment = .center
        
        // adding labels to date and goal

        
        
    }
    
    func updateData(with data: HistoryData) {
//        goalName.text = data.name
        date.text = ""
        //progressBar.text = data.progress
        coinImage.image = UIImage(named: "coin")

        
//        data.date
        
//        date.text
        
//        goalName.text
        
        
        date.text = "Wed, 12/20, 11:30"
        goalName.text = "Biology"
    }
}
