//
//  UIView+Image.swift
//  FLUtilities
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit

public extension UIView {
	
	func imageFromView() -> UIImage {
		UIGraphicsBeginImageContext(self.frame.size)
		self.layer.render(in: UIGraphicsGetCurrentContext()!)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image!
	}
	
}
