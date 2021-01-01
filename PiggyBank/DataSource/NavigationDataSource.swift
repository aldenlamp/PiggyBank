//
//  SidebarDataSource.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit

final class NavigationDataSource {
    
    struct NavigationData {
        let title: String
//        let image: UIImage
        let destination: UIViewController
    }
    
    static let shared = NavigationDataSource()
    
    private let allItems: [NavigationData] = {
        var items = [NavigationData]()
        items.append(NavigationData(title: "Home", destination: ViewController()))
        items.append(NavigationData(title: "Goals", destination: GoalViewController()))
        items.append(NavigationData(title: "History", destination: HistoryViewController()))
        items.append(NavigationData(title: "Impact", destination: ImpactViewController()))
        return items
    }()
    
    func getSidebarData() -> [NavigationData] {
        return allItems
    }
    
}

