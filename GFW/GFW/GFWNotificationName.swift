//
//  GFWNotificationName.swift
//  GFW
//
//  Created by Avazu Holding on 2018/3/9.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import Foundation

enum GFWNotificationName:String {
	
	case userLogin
	case userLogout
	
	case clickNavMoreBtn
	
	//原生值 + 前缀
	var stringValue:String{
		return "GFW" + rawValue
	}
	
	var notificationName:NSNotification.Name{
		return NSNotification.Name(stringValue)
	}
	
}

//自定义扩展
extension NotificationCenter {
	static func post(customeNotification name:GFWNotificationName,object:Any? = nil){
		NotificationCenter.default.post(name: name.notificationName, object: object)
	}
}
