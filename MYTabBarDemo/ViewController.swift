//
//  ViewController.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 26/04/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    // control + drag all tab buttons to this
    // it will give array of buttons
    @IBOutlet var buttons: [UIButton]!
    
    var tab1VC = Tab1ViewController.newInstance
    var tab2VC = Tab2ViewController.newInstance
    var tab3VC = Tab3ViewController.newInstance
    
    lazy var viewControllers: [UIViewController] = {
        return [self.tab1VC, self.tab2VC, self.tab3VC]
    }()

    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set intial state
        let button = self.buttons[selectedIndex]
//        self.buttons[selectedIndex].isSelected = true
        button.isSelected = true
        self.handleTap(button: button)
    }

    @IBAction func didPressTabButton(_ sender: UIButton) {
        self.handleTap(button: sender)
    }

}

// MARK: button 1 actions

extension ViewController {
    
    private func handleTap(button: UIButton) {
        let previousIndex = self.selectedIndex
        
        // reset previous selected button state
        self.buttons[previousIndex].isSelected = false
        
        // remove previous view
        let previousVC = self.viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
    
        self.selectedIndex = button.tag
        button.isSelected = true
        let vc = viewControllers[self.selectedIndex]
        self.addChild(vc)
        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
}

