//
//  ViewController.swift
//  GFW
//
//  Created by 钱卫 on 2018/1/7.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
	static let whiteH:CGFloat = 110
	static let reuserIdentityId = "cell"
	let topV:MainTopView = Bundle.main.loadNibNamed("MainTopView", owner: nil, options: nil)?.last as! MainTopView
    override func viewDidLoad() {
        super.viewDidLoad()
		
        self.view.backgroundColor = UIColor.init(hexColor: "b3b3b3")
		self.automaticallyAdjustsScrollViewInsets = false;
		//set subviews
		setUpViews()
		
		NotificationCenter.default.addObserver(self, selector: #selector(clickMoreBtn), name: GFWNotificationName.clickNavMoreBtn.notificationName, object: nil)
	
    }

	func setUpViews() {

		topV.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: ViewController.whiteH)
		self.view.addSubview(topV)
		
		let layout = UICollectionViewFlowLayout.init()
		layout.minimumLineSpacing = 0
		layout.scrollDirection = UICollectionViewScrollDirection.horizontal
		layout.itemSize = CGSize.init(width: Screen_width, height: (Screen_height - h(object: topV)))
		let collectionV = UICollectionView.init(frame: CGRect.init(x: 0, y: h(object: topV), width: Screen_width, height: (Screen_height - h(object: topV))), collectionViewLayout: layout)
		collectionV.delegate = self
		collectionV.dataSource = self
		collectionV.isPagingEnabled = true
		collectionV.register(UINib.init(nibName: "TimeModuleCell", bundle: nil), forCellWithReuseIdentifier: "TimeModuleCell")
		collectionV.register(UICollectionViewCell().classForCoder, forCellWithReuseIdentifier: ViewController.reuserIdentityId)
		collectionV.register(UINib.init(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
		collectionV.showsHorizontalScrollIndicator = false
		collectionV.backgroundColor = collectionV.superview?.backgroundColor
		self.view.addSubview(collectionV)
		
		collectionV .scrollToItem(at: IndexPath.init(row: 1, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
		
		topV.btnClickBlock = {(tag:NSInteger) in
			collectionV .scrollToItem(at: IndexPath.init(row: tag, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
		var cell:UICollectionViewCell!
		if indexPath.row == 0 {
			let timeCell:TimeModuleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeModuleCell", for: indexPath) as! TimeModuleCell
			cell = timeCell
			timeCell.clickCellBlock = {
				(row : NSInteger)->()in
				print("row")
			}
			cell.contentView.backgroundColor = UIColor.red
		
		}else if indexPath.row == 1{
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath)
			cell.contentView.backgroundColor = UIColor.orange
		}else{
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.reuserIdentityId, for: indexPath)
			cell.contentView.backgroundColor = UIColor.green
		}
		
		return cell
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		let tag = scrollView.contentOffset.x / Screen_width
		self.topV.slide(tag:(Int(tag) > 2 ? 2 : Int(tag)))
		
	}
	
	@objc func clickMoreBtn(){
		let vc = AssetsController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
