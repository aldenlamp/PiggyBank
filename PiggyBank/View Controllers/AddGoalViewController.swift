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
    let nameTextField = UITextField();
    
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
        nameTextField.constrain(to: self.view, topInset: 20, leadingInset: 0, trailingInset: 0)
        nameTextField.constrain(height: 20)
        nameTextField.placeholder = "type goal name"
        nameTextField.borderStyle = UITextField.BorderStyle.line
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
