//
//  ConstantManager.swift
//  GFW
//
//  Created by Avazu Holding on 2018/1/8.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import Foundation
import UIKit
//屏幕宏
let Screen_bounds:CGRect = UIScreen.main.bounds
let Screen_width:CGFloat = UIScreen.main.bounds.width
let Screen_height:CGFloat = UIScreen.main.bounds.height
let StatusBarH:CGFloat = UIApplication.shared.statusBarFrame.size.height
let NavBarHeight:CGFloat = 44

//对get 方法的二次 封装 (其实是 通过函数来实现的)
func x(object: UIView)->CGFloat{
	return object.frame.origin.x
}
func y(object: UIView)->CGFloat{
	return object.frame.origin.y
}
func w(object: UIView)->CGFloat{
	return object.frame.size.width
}
func h(object: UIView)->CGFloat{
	return object.frame.size.height
}

