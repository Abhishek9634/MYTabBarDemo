//
//  RootTabViewController.swift
//  MYTabBarDemo
//
//  Created by Abhishek Thapliyal on 25/05/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class RootTabViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
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
        self.setupCollectionView()
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

extension RootTabViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "TabItemCollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: "TabItemCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TabItemCollectionViewCell",
            for: indexPath
        ) as! TabItemCollectionViewCell
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count = CGFloat(self.viewControllers.count)
        let width: CGFloat = collectionView.bounds.width/4
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
}
