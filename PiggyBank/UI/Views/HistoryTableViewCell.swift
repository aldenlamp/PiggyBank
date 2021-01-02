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
        coinImage.image = UIImage(named: "coinImage")
        
        // self.constrain(height: 100)
        self.backgroundColor = UIColor.white
        
        // adding image, date and goal
        self.addSubview(coinImage)
        coinImage.constrain(width: 100)
        coinImage.constrain(to: self, topInset: 0, bottomInset: 0, leadingInset: 0)
        self.addSubview(date)
        date.constrain(against: goalName, bottomInset: 0)
        date.constrain(to: goalName, heightInset: 0)
        date.constrain(to: self, topInset: 0, trailingInset: 0)
        date.constrain(against: coinImage, leadingInset: 0)
    
    }
}
