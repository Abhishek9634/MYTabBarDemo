//
//  UIExtensions.swift
//  FLUtilities
//
//  Created by Ravindra Soni on 17/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
	
	func addAndFitSubview(view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		view.frame = self.bounds
		self.addSubview(view)
		let views = ["view": view]
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: views))
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: views))
	}
	
}

public extension UITableView {
	
	@IBInspectable var backgroundViewColor: UIColor? {
		set {
			self.backgroundView = UIView()
			self.backgroundView?.backgroundColor = newValue
		}
		get {
			return self.backgroundView?.backgroundColor
		}
	}
	
	func deselectAllRows(animated: Bool) {
		if let indexPaths = self.indexPathsForSelectedRows {
			for indexPath in indexPaths {
				self.deselectRow(at: indexPath, animated: animated)
			}
		}
	}
	
}

public extension UIScrollView {
	
	func preparePaintedPullingHeader(color: UIColor) {
		let mainScreen = UIScreen.main
		let length = max(mainScreen.bounds.height, mainScreen.bounds.width)
		let paintedView = UIView()
		paintedView.frame = CGRect.init(x: 0, y: -length, width: length, height: length)
		paintedView.backgroundColor = color
		self.addSubview(paintedView)
	}
	
}

public extension UICollectionView {
	
	@IBInspectable var backgroundViewColor: UIColor? {
		set {
			self.backgroundView = UIView()
			self.backgroundView?.backgroundColor = newValue
		}
		get {
			return self.backgroundView?.backgroundColor
		}
	}
	
	func deselectAllItems(animated: Bool) {
		if let indexPaths = self.indexPathsForSelectedItems {
			for indexPath in indexPaths {
				self.deselectItem(at: indexPath, animated: animated)
			}
		}
	}
	
}

public extension UITableViewCell {
	
	@IBInspectable var selectedBackgroundViewColor: UIColor? {
		set {
			self.selectedBackgroundView = UIView()
			self.selectedBackgroundView?.backgroundColor = newValue
		}
		get {
			return self.selectedBackgroundView?.backgroundColor
		}
	}
	
	@IBInspectable var backgroundViewColor: UIColor? {
		set {
			self.backgroundView = UIView()
			self.backgroundView?.backgroundColor = newValue
		}
		get {
			return self.backgroundView?.backgroundColor
		}
	}
	
}


public extension UIView {
	
	func roundedCorner(radius: CGFloat) {
		self.clipsToBounds = true
		self.layer.cornerRadius = radius
	}
	
	func circularCorner() {
		self.roundedCorner(radius: self.frame.height/2)
	}
	
	class func nib(nibName: String? = nil) -> UINib {
		return UINib(nibName: nibName ?? self.className(), bundle: nil)
	}
}

public extension UIView {
	
	func applyShadow(
		apply: Bool,
		color: UIColor = UIColor.black,
		offset: CGSize = CGSize(width: 0.0, height: 2.0),
		opacity: Float = 0.2, radius: Float = 1.0) {
		
		self.layer.shadowColor = apply ? color.cgColor : UIColor.white.withAlphaComponent(0.0).cgColor
		self.layer.shadowOffset = apply ? offset : CGSize(width: 0.0, height: 0.0)
		self.layer.shadowOpacity = apply ? opacity : 0.0
		self.layer.shadowRadius = apply ? CGFloat(radius) : 0.0
		
	}
	
	func applyGlow(apply: Bool, color: UIColor) {
		self.layer.shadowColor = apply ? color.cgColor : UIColor.white.withAlphaComponent(0.0).cgColor
		self.layer.shadowOffset = CGSize.zero
		self.layer.shadowOpacity = apply ? 0.4 : 0.0
		self.layer.shadowRadius = apply ? 10.0 : 0.0
		self.layer.masksToBounds = false
	}
}
public extension UIImage {
	
	static func draw(
		size: CGSize,
		opaque: Bool = false,
		scale: CGFloat = 0,
		graphics: (CGContext) -> Void) -> UIImage
	{
		var image: UIImage?
		autoreleasepool {
			UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
			graphics(UIGraphicsGetCurrentContext()!)
			image = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
		}
		return image!
	}
	
	func imageWithAlpha(alpha: CGFloat) -> UIImage {
		let rect = CGRect(origin: CGPoint.zero, size: size)
		return UIImage.draw(size: size, opaque: false, scale: scale) {
			ctx in
			self.draw(in: rect, blendMode: .normal, alpha: alpha)
			}.resizableImage(withCapInsets: capInsets, resizingMode: resizingMode)
			.withRenderingMode(renderingMode)
	}
	
	class func imageWithColor(color: UIColor, frame: CGRect = CGRect(origin: .zero, size: CGSize(width: 1.0, height: 1.0))) -> UIImage {
		let colorView = UIView(frame: frame)
		colorView.backgroundColor = color
		
		UIGraphicsBeginImageContext(colorView.bounds.size)
		colorView.layer.render(in: UIGraphicsGetCurrentContext()!)
		
		let colorImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return colorImage!
	}
	
	func imageTintedWithColor(color: UIColor) -> UIImage {
		let image = UIImage.draw(size: self.size, scale: self.scale) {
			ctx in
			color.setFill()
			UIRectFill(CGRect(origin: CGPoint.zero, size: self.size))
			self.draw(at: CGPoint.zero, blendMode: .destinationIn, alpha: 1)
		}
		if self.capInsets == UIEdgeInsets.zero {
			return image
		}
		return image.resizableImage(withCapInsets: self.capInsets,
		                            resizingMode: self.resizingMode)
	}
	
}

public extension UITableViewCell {
	class var defaultReuseIdentifier: String {
		return self.className()
	}
	
	class var defaultNib: UINib {
		return UINib(nibName: self.className(), bundle: nil)
	}
	
}

public extension UITableViewHeaderFooterView {
	class var defaultReuseIdentifier: String {
		return self.className()
	}
	
	class var defaultNib: UINib {
		return UINib(nibName: self.className(), bundle: nil)
	}
	
}

public extension UICollectionViewCell {
	
	class var defaultReuseIdentifier: String {
		return self.className()
	}
	
	class var defaultNib: UINib {
		return UINib(nibName: self.className(), bundle: nil)
	}
	
}
