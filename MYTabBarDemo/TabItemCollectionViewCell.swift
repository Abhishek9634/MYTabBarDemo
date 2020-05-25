//
//  TabItemCollectionViewCell.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 25/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import FLUtilities


class TabItemCollectionViewCell: MyCollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var highlightView: UIView!
    @IBOutlet weak var middleConstraint: NSLayoutConstraint!
    
    var textSize: CGSize {
        return self.titleLabel.intrinsicContentSize
    }
    
    override var isSelected: Bool {
        willSet {
            self.updateUI(isSelected: newValue)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // dont call method diretly
        // use setNeedLayout() to force update
        //        print("layoutSubviews text size:", self.textSize)
        //        print("layoutSubviews text size:", self.titleLabel.text)
    }
    
    override func configure(_ item: Any?) {
        
    }
    
    private func updateUI(isSelected: Bool) {
        self.titleLabel.text = isSelected ? "Label" : ""
        self.highlightView.backgroundColor = isSelected ?
            UIColor(hexString: "ffa500") :
            .white
        let width = self.textSize.width
        self.middleConstraint.constant = -width + 8.0
        UIView.animate(withDuration: 0.3) {
            self.highlightView.layoutIfNeeded()
        }
    }
    
}
