//
//  RootTab1ViewController.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 26/04/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class RootTab1ViewController: UIViewController {

    static var newInstance: RootTab1ViewController {
        let storyboard = UIStoryboard(name: "Root", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "RootTab1ViewController"
        ) as! RootTab1ViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeView(_ sender: UIButton) {
        self.rootVC?.selectedIndex = 1
    }

}
