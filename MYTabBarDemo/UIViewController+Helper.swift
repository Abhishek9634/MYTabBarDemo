//
//  UIViewController+Helper.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 25/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var rootVC: RootStackTabViewController? {
        var selfVC = self
        while let parentVC = selfVC.parent {
            if let vc = parentVC as? RootStackTabViewController {
                return vc
            } else {
                selfVC = parentVC
            }
        }
        return nil
    }
    
}
