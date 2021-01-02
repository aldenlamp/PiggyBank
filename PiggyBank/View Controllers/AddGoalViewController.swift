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
    let nameTextField = UITextField()
    let addButton = UIButton()
    let piggyImage = UIImageView()
    
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
        
        self.view.addSubview(nameTextField)
        nameTextField.delegate = self
        nameTextField.constrain(height: 40)
        nameTextField.placeholder = "type goal name"
        nameTextField.borderStyle = UITextField.BorderStyle.line
        nameTextField.textAlignment = .center
        
        colorPicker.constrain(to: self.view, leadingInset: 20, centerYInset: 0)
        nameTextField.constrain(to: self.view, trailingInset: -20, centerYInset: 0)
        colorPicker.constrain(width: 150)
        colorPicker.constrain(against: nameTextField, trailingInset: -20)
        
        self.view.addSubview(addButton)
        addButton.setTitle("Add Goal", for: .normal)
        addButton.constrain(width: 150, height: 40)
        addButton.constrain(against: colorPicker, topInset: 20)
        addButton.constrain(to: self.view, centerXInset: 0)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = UIColor.black.cgColor
        addButton.layer.cornerRadius = 10
        
        dismissKey()
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
    /*
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
            // use the row to get the selected row from the picker view
            // using the row extract the value from your datasource (array[row])
    }
 */
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
