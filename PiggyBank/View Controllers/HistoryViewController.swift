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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = Appearance.Colors.backgroundColor
        
        self.view.addSubview(tableView)
        self.view.addSubview(topBar)
        self.view.addSubview(barLine)
        
        topBar.constrain(height: 100)
        barLine.constrain(height: 1)
        
        topBar.constrain(to: self.view, topInset: 0, leadingInset: 0, trailingInset: 0)
        barLine.constrain(to: self.view, leadingInset: 0, trailingInset: 0)
        barLine.constrain(against: topBar, topInset: 0)
        tableView.constrain(against: barLine, topInset: 0)
        tableView.constrain(to: self.view, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "cellIdentifier1")
        tableView.delegate = self
        tableView.dataSource = self
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
    
}
