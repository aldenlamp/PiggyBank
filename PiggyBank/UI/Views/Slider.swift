//
//  Slider.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/2/21.
//

import Foundation
import UIKit

class Slider: UIView{
    
    let slideBar = UIView()
    let slideCircle = UIView()
    let coloredView = UIView()
    
    var delegate: SliderDelegate?
    
    init() {
        super.init(frame: .zero)
        self.addSubview(slideBar)
        slideBar.layer.cornerRadius = 3
        slideBar.constrain(to: self, topInset: 0, bottomInset: 0, leadingInset: 7, trailingInset: -7, centerXInset: 0)
//        slideBar.backgroundColor = UIColor.red
        
        self.addSubview(slideCircle)
        slideCircle.constrain(width: 20, height: 20)
        slideCircle.layer.cornerRadius = 10
//        slideCircle.backgroundColor = UIColor.blue
        
        slideBar.addSubview(coloredView)
        coloredView.constrain(to: slideBar, bottomInset: 0, leadingInset: 0, trailingInset: 0)
//        coloredView.constrain(to: slideCircle, topInset: 0)
        coloredView.layer.cornerRadius = 3
//        coloredView.backgroundColor = UIColor.blue
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        slideCircle.addGestureRecognizer(panGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveSliderToBottom() {
        slideCircle.center.y = slideBar.frame.height - 10
    }
    
    func setSliderColor(to color: UIColor) {
        slideCircle.backgroundColor = color
        coloredView.backgroundColor = color
    }
    
    func setBackgroundColor(to color: UIColor) {
        slideBar.backgroundColor = color
    }
    
    
    var oldY: CGFloat = 0
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        if gesture.state == .began {
            oldY = slideCircle.center.y
        } else if gesture.state == .changed {
            if (oldY + translation.y) < 10{
                slideCircle.center.y = 10
                return
            } else if (translation.y + oldY) > (slideBar.frame.height - 10) {
                slideCircle.center.y = slideBar.frame.height - 10
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
        let prop = Double(slideCircle.center.y) / Double(slideBar.frame.height)
        delegate?.getSliderPosition(proportion: prop)
        
        //TODO: - FIX LATER
//        coloredView.frame.size.height = frame.height - CGFloat(prop) * frame.height
//        print(coloredView.frame.size.height)
        
        
    }
}
protocol SliderDelegate: class {
    func getSliderPosition(proportion: Double)
}
