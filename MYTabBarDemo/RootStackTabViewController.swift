//
//  RootStackTabViewController.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 30/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class RootStackTabViewController: UIViewController {

    @IBOutlet weak var bottomStack: UIStackView!
    
    var currentIndex = 0
    
    lazy var tabs: [StackItemView] = {
        var items = [StackItemView]()
        for _ in 0..<4 {
            items.append(StackItemView.newInstance)
        }
        return items
    }()
    
    lazy var tabModels: [BottomStackItem] = {
        return [
            BottomStackItem(title: "Home"),
            BottomStackItem(title: "Favourite"),
            BottomStackItem(title: "Search"),
            BottomStackItem(title: "Profile")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }

    func setupTabs() {
        for (index, model) in self.tabModels.enumerated() {
            let tabView = self.tabs[index]
            tabView.delegate = self
            tabView.item = model
            self.bottomStack.addArrangedSubview(tabView)
        }
    }
    
    
}

extension RootStackTabViewController: StackItemViewDelegate {
    
    func handleTap(_ view: StackItemView) {
        self.tabs[self.currentIndex].isSelected = false
        view.isSelected = true
        self.currentIndex = self.tabs.firstIndex(where: { $0 === view }) ?? 0
    }
    
}
