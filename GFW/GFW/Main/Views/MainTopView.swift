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
	
	var btnClickBlock:(((NSInteger)) -> (Void))?
	let titles:Array = ["时光轴","签到","排行"]
	var btns:Array<UIButton> = []
	var titleWidths:Array<CGFloat> {
		var widths:Array<CGFloat>? = []
		
		for str in titles {
			
			let w = str.width(withConstrainedHeight: 0, font: UIFont.systemFont(ofSize: 18))
			widths?.append(w)
		}
		return titles.count > 0 ? widths! : []
	}
	let bottomLine:UIView = UIView.init()
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
		//default middle
		let lineW = titleWidths[1]
		let lineX = (x(object: btns[1])) + (w(object: btns[1]) - titleWidths[1]) * 0.5
		bottomLine.frame = CGRect.init(x: lineX, y: 27, width: lineW, height: 2)
		bottomLine.backgroundColor = UIColor.init(hexColor: "333333")
		bottomLine.layer.cornerRadius = 1
		bottomLine.layer.masksToBounds = true
		self.sliderView.addSubview(bottomLine)
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
		btnClickBlock?(sender.tag)
		UIView.animate(withDuration: 0.25, animations: {
			let lineW = self.titleWidths[tag]
			let lineX = (x(object: self.btns[tag])) + (w(object: self.btns[tag]) - self.titleWidths[tag]) * 0.5
			self.bottomLine.frame = CGRect.init(x: lineX, y: 27, width: lineW, height: 2)
		})
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
	
	func slide(tag:Int){
		self.clickBtn(sender: btns[tag])
	}
}

