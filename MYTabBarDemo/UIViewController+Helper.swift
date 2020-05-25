//
//  UIViewController+Helper.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 25/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

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
