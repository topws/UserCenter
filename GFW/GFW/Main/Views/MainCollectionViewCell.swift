//
//  MainCollectionViewCell.swift
//  GFW
//
//  Created by Avazu Holding on 2018/1/16.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var backView: UIView!
	override func awakeFromNib() {
        super.awakeFromNib()
		
		self.backView.backgroundColor = UIColor.init(red: 245.0/255, green: 245.0/255, blue: 245.0/255, alpha: 1.0);
		
    }

}
