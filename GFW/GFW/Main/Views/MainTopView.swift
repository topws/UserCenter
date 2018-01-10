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
	
	let titles:Array = ["时光轴","签到","排行"]
	var btns:Array<UIButton> = []
	var titleWidths:Array<CGFloat> {
		var widths:Array<CGFloat>? = []
		
		for str in titles {
			
			let w = str.width(withConstrainedHeight: 0, font: UIFont.systemFont(ofSize: 18))
			let w1 = strWidth(str: str, fontSize: 18)
			widths?.append(w)
		}
		return titles.count > 0 ? widths! : []
	}
	override func awakeFromNib() {
		super.awakeFromNib()
		sliderSetUp()
	}
	//big:18,333333 midium:15 small:12,ACACAC ,background:EBEBEB
	func sliderSetUp(){
		
		for (index,title) in titles.enumerated() {
			let btn = UIButton.init()
			btn.setTitle(title, for: UIControlState.normal)
			btn.setTitleColor(UIColor.init(hexColor: "acacac"), for: UIControlState.normal)
			btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
			btn.titleLabel?.textAlignment = .center
			let x = CGFloat(index) * (Screen_width/3)
			btn.frame = CGRect.init(x: x, y: 0, width: (Screen_width/3), height: 22)
			self.sliderView.addSubview(btn)
			if index == 1 {
				btn.setTitleColor(UIColor.init(hexColor: "333333"), for: UIControlState.normal)
			}
			btn.tag = index
			btns.append(btn)
			btn.addTarget(self, action: #selector(clickBtn(sender:)), for: UIControlEvents.touchUpInside)
		}
		let lineW = 100
		let lineX = (Screen_width)
		let str = "123e2"
		
		let bottomLine = UIView.init(frame: CGRect.init(x: Int(lineX), y: 27, width: lineW, height: 2))
	}
	
	@objc func clickBtn(sender:UIButton){
		let tag = sender.tag
		for btn in btns {
			if btn.tag == tag {
				btn.setTitleColor(UIColor.init(hexColor: "333333"), for: UIControlState.normal)
			}else{
				btn.setTitleColor(UIColor.init(hexColor: "acacac"), for: UIControlState.normal)
			}
		}
		switch tag {
		case 0:
			print("0")
		case 1:
			print("1")
		case 2:
			print("2")
		default:
			print("error")
		}
	}
	@IBAction func moreBtnClick(_ sender: UIButton) {
		print("more")
	}
	@IBAction func wechatClick(_ sender: UIButton) {
		print("wechat")
	}
}

