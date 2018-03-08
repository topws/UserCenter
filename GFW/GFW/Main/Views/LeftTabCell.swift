//
//  LeftTabCell.swift
//  GFW
//
//  Created by Avazu Holding on 2018/3/5.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import UIKit

class LeftTabCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		bottomLine.backgroundColor = UIColor.clear
    }

	@IBOutlet weak var titleLB: UILabel!
	
	@IBOutlet weak var bottomLine: UIView!
	
	@IBAction func clickBtn(_ sender: UIButton) {
		
		
	}
	
}
