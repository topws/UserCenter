//
//  SideBarmanager.swift
//  SidebarDemo
//
//  Created by Avazu Holding on 2018/3/12.
//  Copyright © 2018年 Avazu Holding. All rights reserved.
//

import UIKit

enum SideBarManagerShowType:Int {
	case SideBarManagerShowLeft //动画显示
	case SideBarManagerShowCenter
	case SideBarManagerShowLeftWithoutAnimation// 不带有动画显示
	case SideBarManagerShowCenterWithoutAnimation
}
//public
let kLeftWidthScale:CGFloat = 0.75

final class SideBarmanager{
	
	//private
	private lazy var pan = {
		return UIPanGestureRecognizer.init(target: self, action: #selector(self.handlePanGestureRecognizer(pan:)))
	}()
	private var centerViewController:UIViewController?
	private var leftView:UIView?
	private let blackV:UIView = {
		let view:UIView = UIView.init(frame: UIScreen.main.bounds)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.4)
		view.alpha = 0.0
		view.tag = 999;
		return view
	}()
	//add sideBar
	func addSideBar(vc:UIViewController,view:UIView){
		self.leftView = view
		self.centerViewController = vc
		
		self.showShadow()
		self.centerViewController?.view.addGestureRecognizer(self.pan)
	}
	
	func showShadow(){
		if self.centerViewController?.view == nil {return}
		self.centerViewController?.view.layer.shadowColor = UIColor.black.cgColor
		self.centerViewController?.view.layer.shadowOffset = CGSize.init(width: 6, height: 6)
		self.centerViewController?.view.layer.shadowOpacity = 0.7
		self.centerViewController?.view.layer.shadowRadius = 6.0
	}
	func hideShadow(){
		if self.centerViewController?.view == nil {return}
		self.centerViewController?.view.layer.shadowColor = UIColor.white.cgColor
		self.centerViewController?.view.layer.shadowOffset = CGSize.init(width: 0, height: 0)
		self.centerViewController?.view.layer.shadowOpacity = 0
		self.centerViewController?.view.layer.shadowRadius = 0
	}
	func beginDragResponse(){
		if self.centerViewController?.view == nil {return}
		self.centerViewController?.view.addGestureRecognizer(self.pan)
	}
	func cancelDragResponse(){
		if self.centerViewController?.view == nil {return}
		self.centerViewController?.view.removeGestureRecognizer(self.pan)
	}
	func resetShowType(showType:SideBarManagerShowType){
		if self.centerViewController?.view == nil {return}
		
		//swift 3以后许多 全局C函数 被映射到 相应类型的成员函数
		guard let window = UIApplication.shared.delegate?.window else {
			return
		}
		guard let transform:CGAffineTransform = window?.transform else {
			return
		}
		let rightScopeTransform:CGAffineTransform = transform.translatedBy(x: (kScreenWidth * kLeftWidthScale), y: 0)
		switch showType {
		case SideBarManagerShowType.SideBarManagerShowLeft:
			do {
			UIView.animate(withDuration: 0.2, animations: {
				self.centerViewController?.view.transform = rightScopeTransform
				window?.subviews.first?.transform.tx = (self.centerViewController?.view.transform.tx)! / 3
			})
			break
		}
		case SideBarManagerShowType.SideBarManagerShowCenter:
			do {
				UIView.animate(withDuration: 0.2, animations: {
					self.centerViewController?.view.transform = CGAffineTransform.identity
					window?.subviews.first?.transform.tx = (self.centerViewController?.view.transform.tx)! / 3
				})
				break
			}
		case SideBarManagerShowType.SideBarManagerShowLeftWithoutAnimation:
			do {
				self.centerViewController?.view.transform = rightScopeTransform
				window?.subviews.first?.transform.tx = (self.centerViewController?.view.transform.tx)! / 3
				break
			}
		case SideBarManagerShowType.SideBarManagerShowCenterWithoutAnimation:
			do {
				self.centerViewController?.view.transform = CGAffineTransform.identity
				window?.subviews.first?.transform.tx = (self.centerViewController?.view.transform.tx)! / 3
				break
			}
		}
	}
	//pan
	@objc func handlePanGestureRecognizer(pan:UIPanGestureRecognizer){
		
		//sender.view.tx / 3 的原因是要让中心控制器每向右移动一像素，左侧视图就向右移动 1/3 像素
		//另外在初始化左侧视图的时候将其 frame.origin.x 设置为 -kScreenWidth * (1 - kLeftWidthScale), 这样将 tx / 3 就会刚好在左侧视图刚好展示完成时保证左侧视图的 origin.x与屏幕左侧边缘重合
		guard let window = UIApplication.shared.delegate?.window else {
			return
		}
		guard let transform:CGAffineTransform = window?.transform else {
			return
		}
		//1 获取手指拖拽的时的 平移值
		let translation:CGPoint = pan.translation(in: pan.view)
		//2 让当前视图进行平移
		pan.view?.transform = (pan.view?.transform.translatedBy(x: translation.x, y: 0))!
		window?.subviews.first?.transform.tx = (pan.view?.transform.tx)! / 3

		//3  重置平移值（防止叠加）
		pan.setTranslation(CGPoint.zero, in: pan.view)
		//4 获取最右边的范围
		let rightScopeTransform = transform.translatedBy(x: kScreenWidth * kLeftWidthScale, y: 0)
		if (pan.view?.transform.tx)! > rightScopeTransform.tx {
			//当移动到右边的极限时
			//限制最右边的范围
			pan.view?.transform = rightScopeTransform
			window?.subviews.first?.transform.tx = (pan.view?.transform.tx)! / 3
		}else if (pan.view?.transform.tx)! < (0.0 as CGFloat){
			//限制最左边的范围
			pan.view?.transform = transform.translatedBy(x: 0, y: 0)
			window?.subviews.first?.transform.tx = (pan.view?.transform.tx)! / 3
		}
		
		//5 增加一个黑色蒙版于 pan.view上
		var flag = false
		for subV:UIView in (pan.view?.subviews)! {
			if subV.tag == 999{
				flag = true
				break
			}
		}
		if !flag {
			pan.view?.addSubview(blackV)
		}
		let blackViewAlpha = (pan.view?.frame.origin.x)! / (kScreenWidth * kLeftWidthScale)
		self.blackV.alpha = blackViewAlpha > 1 ? 1 : blackViewAlpha;
		
		//拖拽结束时
		if pan.state == UIGestureRecognizerState.ended {
			UIView.animate(withDuration: 0.2, animations: {
				if (pan.view?.frame.origin.x)! > kScreenWidth * 0.5 {
					pan.view?.transform = rightScopeTransform
					window?.subviews.first?.transform.tx = (pan.view?.transform.tx)! / 3
				}else{
					pan.view?.transform = CGAffineTransform.identity
					window?.subviews.first?.transform.tx = (pan.view?.transform.tx)! / 3
					self.blackV.removeFromSuperview()
				}
			})
			print("end = \(pan.view?.frame.origin.x)")
		}
		
	}
	
	//sigleton
	static let share = SideBarmanager()
	private init() {}
}
