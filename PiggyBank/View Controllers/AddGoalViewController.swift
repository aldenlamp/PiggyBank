//
//  NewGoalViewController.swift
//  PiggyBank
//
//  Created by Kayla Wang on 1/1/21.
//

import Foundation
import UIKit

class AddGoalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let colorPicker = UIPickerView()
    var colors = [String]()
    var color = "pink"
    let nameTextField = UITextField()
    let addButton = UIButton()
    let piggyImage = UIImageView()
    let container = UIView()
    let goalTextField = UITextField()
    weak var delegate: AddGoalVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        var iterateColors = 0
        for color in Appearance.PigColors.allCases {
            colors.append(color.rawValue)
            iterateColors += 1
        }
        
        colorPicker.delegate = self as UIPickerViewDelegate
        colorPicker.dataSource = self as UIPickerViewDataSource
        
        self.view.addSubview(colorPicker)
        colorPicker.center = self.view.center
        
        self.view.addSubview(container)
        container.constrain(to: self.view, trailingInset: -20, centerYInset: 0)
        
        container.addSubview(nameTextField)
        nameTextField.delegate = self
        nameTextField.constrain(height: 40)
        nameTextField.placeholder = "Goal Name"
        nameTextField.textAlignment = .center
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.cornerRadius = 10
        nameTextField.constrain(to: container, topInset: 0, leadingInset: 0, trailingInset: 0)
        
        container.addSubview(goalTextField)
        goalTextField.keyboardType = .numberPad
        goalTextField.delegate = self;
        goalTextField.constrain(height: 40)
        goalTextField.placeholder = "Goal"
        goalTextField.textAlignment = .center
        goalTextField.layer.borderWidth = 2
        goalTextField.layer.borderColor = UIColor.black.cgColor
        goalTextField.layer.cornerRadius = 10
        goalTextField.constrain(to: nameTextField, widthInset: 0, heightInset: 0)
        goalTextField.constrain(against: nameTextField, topInset: 0)
        goalTextField.constrain(to: container, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        colorPicker.constrain(to: self.view, leadingInset: 20, centerYInset: 0)
        colorPicker.constrain(width: 150)
        colorPicker.constrain(against: container, trailingInset: -20)
        
        self.view.addSubview(addButton)
        addButton.setTitle("Add Goal", for: .normal)
        addButton.constrain(width: 150, height: 40)
        addButton.constrain(against: colorPicker, topInset: 10)
        addButton.constrain(to: self.view, centerXInset: 0)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = UIColor.black.cgColor
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: #selector(addGoal), for: .touchUpInside)
        
        dismissKey()
        
        self.view.addSubview(piggyImage)
        piggyImage.constrain(to: self.view, centerXInset: 0)
        piggyImage.constrain(against: colorPicker, bottomInset: 0)
        piggyImage.constrain(width: 200, height: 200)
        piggyImage.image = UIImage(named: "pinkPig")
    }
    @objc func addGoal() {
        delegate!.getNewGoalData()
        self.dismiss(animated: true, completion: nil)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Appearance.PigColors.allCases.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = colors[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        color = colors[row]
        switch color {
        case "pink":
            piggyImage.image = UIImage(named: "pinkPig")
        case "red":
            piggyImage.image = UIImage(named: "redPig")
        case "orange":
            piggyImage.image = UIImage(named: "orangePig")
        case "yellow":
            piggyImage.image = UIImage(named: "yellowPig")
        case "green":
            piggyImage.image = UIImage(named: "greenPig")
        case "blue":
            piggyImage.image = UIImage(named: "bluePig")
        case "purple":
            piggyImage.image = UIImage(named: "purplePig")
        default:
            piggyImage.image = UIImage(named: "pinkPig")
        }
    }
    
}
extension UIViewController {
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
protocol AddGoalVCDelegate: class {
    func getNewGoalData()
}
