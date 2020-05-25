//
//  RootTabViewController.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 25/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class RootTabViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var tab1VC = Tab1ViewController.newInstance
    var tab2VC = Tab2ViewController.newInstance
    var tab3VC = Tab3ViewController.newInstance
    
    lazy var viewControllers: [UIViewController] = {
        return [
            self.tab1VC, self.tab2VC, self.tab3VC
        ]
    }()
    
    private var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

extension RootTabViewController {
    
    // vimp code do not delete
    
    private func updateView() {
        let previousIndex = self.selectedIndex
        
//        REMOVE PREVIOUS VIEW
        
        let previousVC = self.viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        // ADD NEW VIEW
        
        let vc = self.viewControllers[self.selectedIndex]
        self.addChild(vc)
        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
}

extension UIViewController {
    
    var rootVC: RootTabViewController? {
        var selfVC = self
        while let parentVC = selfVC.parent {
            if let vc = parentVC as? RootTabViewController {
                return vc
            } else {
                selfVC = parentVC
            }
        }
        return nil
    }
    
}
