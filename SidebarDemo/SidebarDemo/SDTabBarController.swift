//
//  SDTabBarController.swift
//  SidebarDemo
//
//  Created by Avazu Holding on 2018/3/12.
//  Copyright © 2018年 Avazu Holding. All rights reserved.
//

import UIKit

class SDTabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
		self.delegate = self
		addChildVC()
    }
	
	func addChildVC(){
		
		// message
		let mvc = MessageVc()
		let mNav = UINavigationController.init(rootViewController: mvc)
		mNav.tabBarItem.title = "Message"
		mNav.tabBarItem.image = UIImage.init(named: "tab_recent_nor")
		
		//contact
		let cvc = ContactsVc()
		let cNav = UINavigationController.init(rootViewController: cvc)
		cNav.tabBarItem.title = "Contact"
		cNav.tabBarItem.image = UIImage.init(named: "tab_buddy_nor")
		
		self .addChildViewController(mNav)
		self .addChildViewController(cNav)
		
	}

	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		print("\(viewController)")
		if viewController.isKind(of: UINavigationController.classForCoder()){
			let nav:UINavigationController = viewController as! UINavigationController
			let vc:UIViewController = nav.viewControllers.first!
			if vc.isKind(of: MessageVc.classForCoder()){
				SideBarmanager.share.beginDragResponse()
			}else{
				SideBarmanager.share.cancelDragResponse()
			}
		}
	}

}
