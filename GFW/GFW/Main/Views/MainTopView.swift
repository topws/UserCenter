//
//  MainTopView.swift
//  GFW
//
//  Created by Avazu Holding on 2018/1/9.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import Foundation
import UIKit

class MainTopView:UIView{
	
	@IBOutlet weak var moreBtn: UIButton!
	@IBOutlet weak var wechatBtn: UIButton!
	@IBOutlet weak var sliderView: UIView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		sliderSetUp()
	}
	
	func sliderSetUp(){
		let lineW = 100
		let lineX = (Screen_width)
 
		let bottomLine = UIView.init(frame: CGRect.init(x: <#T##CGFloat#>, y: 27, width: <#T##CGFloat#>, height: 2))
	}
	
	
	@IBAction func moreBtnClick(_ sender: UIButton) {
		print("more")
	}
	@IBAction func wechatClick(_ sender: UIButton) {
		print("wechat")
	}
}

