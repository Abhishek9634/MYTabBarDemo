//
//  Tab1ViewController.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 26/04/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class Tab3ViewController: UIViewController {

    static var newInstance: Tab3ViewController {
        let storyboard = UIStoryboard(name: "tab3", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "Tab3ViewController"
        ) as! Tab3ViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
