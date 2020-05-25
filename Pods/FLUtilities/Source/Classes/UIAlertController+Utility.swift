//
//  UIAlertController+Utility.swift
//  FLUtilities
//
//  Created by Ravindra Soni on 17/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

// ActionInterface configures the characteristics of the action you want to show
// All the properties, other than Title, has default properties so if you can just set the title for a quick use

public extension UIApplication {
	class var topController: UIViewController? {
		if var topController = UIApplication.shared.keyWindow?.rootViewController {
			while let presentedViewController = topController.presentedViewController {
				topController = presentedViewController
			}
			return topController
		}
		return nil
	}
}

public struct ActionInterface {
	// default value of "id" is "title"
	// you can set your own id as well for uniquesness
	
	public var id: AnyObject!
	public var title: String = ""
    public var style: UIAlertAction.Style = .default
	public var alertAction: UIAlertAction!
	
	public init(id: AnyObject? = nil, title: String, style: UIAlertAction.Style = .default) {
        self.id = id ?? title as AnyObject?
		self.title = title
		self.style = style
	}
}

public typealias AlertHandler = (ActionInterface) -> Void

public extension UIAlertController {
	class func showAlertForMessage(message: String) {
		let okActionInterface = ActionInterface(title: NSLocalizedString("Ok", comment: ""))
		
		UIAlertController.showAlert(
			title: "",
			message: message,
			actionInterfaceList: [okActionInterface])
		{ (interface) in
			
		}
	}
	
	class func showAlert(title: String?, message: String?, actionInterfaceList: [ActionInterface], handler: @escaping AlertHandler) {
		self.showAlertController(
			title: title,
			message: message,
			preferredStyle: .alert,
			actionInterfaceList: actionInterfaceList,
			handler: handler
		)
	}
	
	class func showActionSheet(title: String?, message: String?, actionInterfaceList: [ActionInterface], handler: @escaping AlertHandler) {
		self.showAlertController(
			title: title,
			message: message,
			preferredStyle: .actionSheet,
			actionInterfaceList: actionInterfaceList,
			handler: handler
		)
	}
	
    class func showAlertController(title: String?, message: String?, preferredStyle: UIAlertController.Style, actionInterfaceList: [ActionInterface], handler: @escaping AlertHandler) {
		let alertController = UIAlertController.alertController(
			title: title,
			message: message,
			preferredStyle: preferredStyle,
			actionInterfaceList: actionInterfaceList,
			handler: handler
		)
		if let topController = UIApplication.topController {
			topController.present(alertController, animated: true, completion: { () -> Void in
			})
		}
	}
	
	class func alertController(title: String?, message: String?, preferredStyle: UIAlertController.Style, actionInterfaceList: [ActionInterface], handler: @escaping AlertHandler) -> UIAlertController {
		let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: preferredStyle)
		for var actionInterface in actionInterfaceList {
			let button = UIAlertAction(title: actionInterface.title, style: actionInterface.style, handler: { (action: UIAlertAction) -> Void in
				actionInterface.alertAction = action
				handler(actionInterface)
			})
			alertController.addAction(button)
		}
		return alertController
	}
	
	
	class func showErrorAlert(error: NSError) {
		let okActionInterface = ActionInterface(title: NSLocalizedString("OK", comment: ""))
		let title = NSLocalizedString("Error", comment: "")
		let message = error.localizedDescription
		
		UIAlertController.showAlert(
			title: title,
			message: message,
			actionInterfaceList: [okActionInterface])
		{ (_) in
			
		}
	}
}

public extension UIViewController {
	
	func showErrorAlert(error: NSError) {
		self.showErrorAlert(message: error.localizedDescription)
	}
	
	func showErrorAlert(message: String?) {
		let okActionInterface = ActionInterface(title: NSLocalizedString("OK", comment: ""))
		let title = NSLocalizedString("Error", comment: "")
		
		self.showAlert(
			title: title,
			message: message,
			actionInterfaceList: [okActionInterface]) { _ in
				
		}
	}
	
	func showAlert(title: String?, message: String?, actionInterfaceList: [ActionInterface], handler: @escaping AlertHandler) {
		self.showAlertController(
			title: title,
			message: message,
			preferredStyle: .alert,
			actionInterfaceList: actionInterfaceList,
			handler: handler
		)
	}
	
	func showActionSheet(title: String?, message: String?, actionInterfaceList: [ActionInterface], handler: @escaping AlertHandler) {
		self.showAlertController(
			title: title,
			message: message,
			preferredStyle: .actionSheet,
			actionInterfaceList: actionInterfaceList,
			handler: handler
		)
	}
	
	func showAlertController(title: String?, message: String?, preferredStyle: UIAlertController.Style, actionInterfaceList: [ActionInterface], handler: @escaping AlertHandler) {
		let alertController = UIAlertController.alertController(
			title: title,
			message: message,
			preferredStyle: preferredStyle,
			actionInterfaceList: actionInterfaceList,
			handler: handler
		)
		self.present(alertController, animated: true, completion: nil)
	}
	
}
