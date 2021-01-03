//
//  PigTimer.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/2/21.
//

import Foundation
import UIKit


class PigTimer: UIView {
    
    private let pigImageView = UIImageView()
    private let centerView = UIView()
    private let timerLabel = UILabel()
    
    var pigColor: Appearance.PigColors = .pink {
        didSet {
            pigImageView.image = Appearance.getImage(for: pigColor)
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(pigImageView)
        pigImageView.constrain(to: self, topInset: 0, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        self.addSubview(centerView)
        centerView.constrain(to: self, centerYInset: 0, centerXInset: 8)
        centerView.constrain(width: 85, height: 45)
        centerView.backgroundColor = UIColor.white
        centerView.layer.borderWidth = 1
        centerView.layer.borderColor = Appearance.Colors.borderColor.cgColor
        
        centerView.addSubview(timerLabel)
        timerLabel.constrain(to: centerView, topInset: 0, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        timerLabel.textColor = UIColor.black
        timerLabel.textAlignment = .center
        timerLabel.font = Appearance.Fonts.timerLabelFont
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTimer(with minutes: Int) {
        let hours = minutes / 60
        let minutes = minutes % 60
        
        let timeStr = "\(hours < 10 ? "0" : "")\(hours):\(minutes < 10 ? "0" : "")\(minutes)"
        timerLabel.text = timeStr
    }
}
