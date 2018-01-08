//
//  ViewController.swift
//  GFW
//
//  Created by 钱卫 on 2018/1/7.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	static let whiteH:CGFloat = 200
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.init(hexColor: "b3b3b3")
		setUpViews()
    }

	func setUpViews() {
		
		let whiteV = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: ViewController.whiteH))
		whiteV.backgroundColor = UIColor.white
		self.view.addSubview(whiteV)
		
		let nav:UIView = UIView.init(frame: CGRect.init(x: 0, y: 20, width: Screen_width, height: NavBarHeight))
		nav.backgroundColor = UIColor.white
		
		let title:UILabel = UILabel.init()
		title.text = "GFW"
		title.textColor = UIColor.init(hexColor: "333333")
		
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

