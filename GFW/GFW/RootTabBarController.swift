//
//  RootTabBarController.swift
//  GFW
//
//  Created by Avazu Holding on 2018/3/9.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import Foundation
import UIKit
class RootTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		creatSubViewControllers()
	}
	
	func creatSubViewControllers(){
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.green], for: UIControlState.normal)
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.red], for: UIControlState.selected)
		
		let v1 = ViewController()
		let item1 : UITabBarItem = UITabBarItem.init(title: "First", image: UIImage.init(named: "gray_advices")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "advices")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
		v1.tabBarItem = item1
		
		
		let v2 = UIViewController()
		let item2 : UITabBarItem = UITabBarItem.init(title: "Second", image: UIImage.init(named: "gray_advices"), selectedImage: UIImage.init(named: "advices"))
		v2.tabBarItem = item2
		let tabArray = [v1,v2]
		self.viewControllers = tabArray
	}
}
