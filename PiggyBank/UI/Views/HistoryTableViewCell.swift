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
    let coinTime = UILabel()
    
    let time = UILabel()
    
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
        self.backgroundColor = Appearance.Colors.backgroundColor
        self.selectionStyle = .none
        
        // adding image, date and goal
        self.addSubview(coinImage)
        let padding: CGFloat = 15
        coinImage.constrain(to: self, topInset: padding, bottomInset: -padding, leadingInset: padding)
        coinImage.widthAnchor.constraint(equalTo: coinImage.heightAnchor).isActive = true
        coinImage.image = UIImage(named: "coin")
        
        coinImage.addSubview(coinTime)
        coinTime.constrain(to: coinImage, topInset: 0, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        coinTime.textAlignment = .center
        coinTime.font = Appearance.Fonts.goalTitle
        coinTime.textColor = UIColor.white
        
        
        self.addSubview(time)
        time.constrain(to: self, centerYInset: 0)
        time.constrain(width: 130, height: 25)
        time.constrain(against: coinImage, leadingInset: 10)
        time.textColor = UIColor.white
        time.font = Appearance.Fonts.goalTitle
        
        self.addSubview(date)
        self.addSubview(goalName)
        
        date.constrain(to: self, trailingInset: -40)
        date.constrain(against: time, leadingInset: 10)
        date.constrain(to: coinImage, topInset: 15)
        
        goalName.constrain(against: time, leadingInset: 10)
        goalName.constrain(to: coinImage, bottomInset: -15)
        goalName.heightAnchor.constraint(equalTo: date.heightAnchor).isActive = true
        goalName.widthAnchor.constraint(equalTo: date.widthAnchor).isActive = true
        
        date.textAlignment = .left
        date.font = Appearance.Fonts.contentTitle
        date.textColor = UIColor.white
        
        goalName.textAlignment = .left
        goalName.font = Appearance.Fonts.contentTitle
        goalName.textColor = UIColor.white
        
    }
    
    func updateData(with data: HistoryData) {
        coinTime.text = "\(data.length)m"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        time.text = dateFormatter.string(from: data.date)
        
        dateFormatter.dateFormat = "E, MMM dd"
        date.text = dateFormatter.string(from: data.date)
        
        goalName.text = DataManager.shared.getGoalName(of: data.goalID)
    
        
    }
}
