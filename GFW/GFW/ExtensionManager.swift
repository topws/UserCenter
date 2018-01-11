//
//  ExtensionManager.swift
//  GFW
//
//  Created by Avazu Holding on 2018/1/8.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import Foundation
import UIKit

//使用扩展需要使用 extension 关键字，这里的 类型可以是 类、结构体、枚举、协议等类型
extension UIColor{
	
	convenience  init(hexColor: String) {
		
		var red:UInt32 = 0,green:UInt32 = 0,blue:UInt32 = 0
		
		// 分别转换进行转换
		Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
		
		Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
		
		Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
		
		self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
	}
}

extension String {
	
	/// String使用下标截取字符串
	/// 例: "示例字符串"[0..<2] 结果是 "示例"
	subscript (r: Range<Int>) -> String {
		get {
			let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
			let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
			
			return String(self[startIndex..<endIndex])
		}
	}
}

extension String {
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
		
		return ceil(boundingBox.height)
	}
	
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
		
		return ceil(boundingBox.width)
	}
}

extension UIButton {
	func x()->CGFloat{
		return self.frame.origin.x
	}
}

