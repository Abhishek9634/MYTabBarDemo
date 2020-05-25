//
//  NSObject+Utility.swift
//  FLUtilities
//
//  Created by Ravindra Soni on 17/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public extension NSObject {
	
	class func className() -> String {
		let className = (NSStringFromClass(self) as String).components(separatedBy: ".").last! as String
		return className
	}
	
	func className() -> String {
		let className = (NSStringFromClass(self.classForCoder) as String).components(separatedBy: ".").last! as String
		return className
	}
	
}
