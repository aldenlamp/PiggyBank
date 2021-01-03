//
//  HistoryViewController.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let topBar = UIView()
    let historyLabel = UILabel()
    let menuButton: UIButton = {
        let mView = UIButton()
        for i in 0..<3 {
            let topBar = UIView(frame: CGRect(x: 0, y: i*9, width: 30, height: 4))
            topBar.layer.cornerRadius = 2
            topBar.backgroundColor = UIColor.white
            mView.addSubview(topBar)
        }
        mView.constrain(width: 30, height: 22)
        return mView
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.backgroundColor = Appearance.Colors.backgroundColor
        topBar.backgroundColor = Appearance.Colors.lightBlue
        self.view.addSubview(tableView)
        self.view.addSubview(topBar)
        topBar.addSubview(historyLabel)
        topBar.addSubview(menuButton)
        
        topBar.constrain(height: 100)
        
        topBar.constrain(to: self.view, topInset: 0, leadingInset: 0, trailingInset: 0)
        tableView.constrain(against: topBar, topInset: 0)
        tableView.constrain(to: self.view, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "cellIdentifier1")
        tableView.delegate = self
        tableView.dataSource = self
        
        historyLabel.text = "History"
        historyLabel.textAlignment = .center
        historyLabel.textColor = .white
        historyLabel.constrain(to: topBar, bottomInset: -10, leadingInset: 0, trailingInset: 0, centerXInset: 0)
        historyLabel.font = Appearance.Fonts.goalTitle
        
        menuButton.constrain(to: topBar, topInset: 60, leadingInset: 30)
        menuButton.addTarget(self, action: #selector(handleMenuPressed), for: .touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Appearance.TABLE_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier1") as! HistoryTableViewCell
        
        cell.updateData(with: DataManager.shared.historyData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.historyData.count
    }
    @objc func handleMenuPressed() {
        NotificationCenter.default.post(name: NotificationNames.toggleSideBar.notification, object: nil)
    }
}
