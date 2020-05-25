//
//  UIViewController+Share.swift
//  FLUtilities
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit

public extension UIViewController {
	typealias CompletionBlock = (Bool) -> Void
	func  share(text: String? = nil, urlStrings: [String]? = nil, images: [UIImage]? = nil, completion:CompletionBlock?  = nil) {
		var activityItems = [AnyObject]()
		if let text = text {
			activityItems.append(text as AnyObject)
		}
		
		if let urlStrings = urlStrings {
			for urlString in urlStrings {
				if let url = NSURL(string: urlString) {
					activityItems.append(url)
				}
			}
		}
		
		if let images = images {
			for image in images {
				activityItems.append(image)
			}
		}
		
		if activityItems.count <= 0 {
			completion?(true)
		}
		
		let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
		activityController.completionWithItemsHandler = {(_, completed, _, _) in
			completion?(completed)
		}
		present(activityController, animated: true, completion: nil)
	}
}
