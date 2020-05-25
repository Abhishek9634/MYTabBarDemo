//
//  RootTabViewController.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 25/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class RootTabViewController: UITabBarController {

    var tab1VC = Tab1ViewController.newInstance
    var tab2VC = Tab2ViewController.newInstance
    var tab3VC = Tab3ViewController.newInstance
    
    override var selectedIndex: Int {
        willSet {
            //
        }
        didSet {
            print(self.selectedIndex)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTab()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setTab() {
        self.tabBar.isHidden = true

        // TAB
//        Or you can change z position of tab bar this way:
//        self.tabBar.layer.zPosition = -1
//        and if you want to show it again then:
//        self.tabBar.layer.zPosition = 0
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
