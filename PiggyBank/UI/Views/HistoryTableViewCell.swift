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
        coinImage.image = UIImage(named: "piggyBank")
        
        // self.constrain(height: 100)
        self.backgroundColor = UIColor.white
        
        // adding image, date and goal
        self.addSubview(coinImage)
        coinImage.constrain(width: Appearance.TABLE_CELL_HEIGHT)
        coinImage.constrain(to: self, topInset: 0, bottomInset: 0, leadingInset: 0)
        
        // adding goal name
        self.addSubview(goalName)
        
        goalName.constrain(to: self, bottomInset: 0, trailingInset: 0)
        
        
        // adding date
        self.addSubview(date)
        
        date.constrain(to: goalName, heightInset: 0)
        date.constrain(to: self, topInset: 0, trailingInset: 0)
        date.constrain(against: coinImage, leadingInset: 0)
        date.constrain(against: goalName, bottomInset: 0)
        
        goalName.constrain(against: date, topInset: 0)
        goalName.constrain(to: date, heightInset: 0)
        
        // adding labels to date and goal
        date.text = "Wed, 12/20, 11:30"
        date.textAlignment = .center
        goalName.text = "Biology"
        goalName.textAlignment = .center
        
    
    }
}
