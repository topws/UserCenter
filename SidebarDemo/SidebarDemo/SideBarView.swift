//
//  SideBarView.swift
//  SidebarDemo
//
//  Created by Avazu Holding on 2018/3/13.
//  Copyright © 2018年 Avazu Holding. All rights reserved.
//

import UIKit

class SideBarView: UIView,UITableViewDelegate,UITableViewDataSource {

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setUpViews()
	}
	
	func setUpViews(){
		self.backgroundColor = UIColor.blue
		
		let tab:UITableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), style: UITableViewStyle.plain)
		tab.delegate = self
		tab.dataSource = self
		
		tab.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
		self.addSubview(tab)
		tab.reloadData()
		
		tab.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "sidebar_bg")!)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 40
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
		cell.textLabel?.text = String.init(format: "1111---%d", indexPath.row)
		cell.textLabel?.textColor = UIColor.red
		return cell
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
