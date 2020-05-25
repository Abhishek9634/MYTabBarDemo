//
//  RootTab2ViewController.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 26/04/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class RootTab2ViewController: UIViewController {
    
    static var newInstance: RootTab2ViewController {
        let storyboard = UIStoryboard(name: "Root", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "RootTab2ViewController"
        ) as! RootTab2ViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeView(_ sender: UIButton) {
        self.rootVC?.selectedIndex = 0
    }
    
}

