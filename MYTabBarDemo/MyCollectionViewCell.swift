//
//  MyCollectionViewCell.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 25/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var delegate: NSObjectProtocol?
    
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    func configure(_ item: Any?) {
        
    }
    
}
