//
//  Slider.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/2/21.
//

import Foundation
import UIKit

class Slider: UIView {
    let slideBar = UIView()
    let slideCircle = UIView()
    
    var delegate: SliderDelegate?
    
    init() {
        super.init(frame: .zero)
        self.addSubview(slideBar)
        slideBar.constrain(width: 6)
        slideBar.layer.cornerRadius = 3
        slideBar.constrain(to: self, topInset: 0, bottomInset: 0, centerXInset: 0)
        slideBar.backgroundColor = UIColor.red
        
        self.addSubview(slideCircle)
        slideCircle.constrain(width: 20, height: 20)
        slideCircle.layer.cornerRadius = 10
        slideCircle.backgroundColor = UIColor.blue
        slideCircle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var oldY: CGFloat = 0
    
    func moveSliderToBottom() {
        slideCircle.center.y = slideBar.frame.height - 10
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        if gesture.state == .began {
            oldY = slideCircle.center.y
        } else if gesture.state == .changed {
            if ((slideCircle.center.y) < 0 && translation.y < 0) || ((slideCircle.center.y) > (slideBar.frame.height - 10) && translation.y > 0){
                return
            }
            slideCircle.center.y = translation.y + oldY
        } else if gesture.state == .ended {
            if (slideCircle.center.y < 0){
                slideCircle.center.y = 10
            } else if (slideCircle.center.y > slideBar.frame.height - 10) {
                slideCircle.center.y = slideBar.frame.height - 10
            }
        }
        delegate?.getSliderPosition(proportion: Double(slideCircle.center.y) / Double(slideBar.frame.height))
    }
}
protocol SliderDelegate: class {
    func getSliderPosition(proportion: Double)
}
