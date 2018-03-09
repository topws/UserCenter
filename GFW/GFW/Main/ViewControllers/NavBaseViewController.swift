//
//  NavBaseViewController.swift
//  GFW
//
//  Created by Avazu Holding on 2018/3/9.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import UIKit

class NavBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.navigationBar.isHidden = true;
//		self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_back"), style: UIBarButtonItemStyle.plain, target: self, action: )
		
		let back:UIButton = UIButton.init(frame: CGRect.init(x: 20, y: 0, width: 40, height: 40))
		back.setImage(UIImage.init(named: "icon_back"), for: .normal)
		back.addTarget(self, action: #selector(clickback), for: UIControlEvents.touchUpInside)
		back.backgroundColor = UIColor.red
		self.view.addSubview(back)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	@objc func clickback(){
		self.navigationController?.popViewController(animated: true)
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
