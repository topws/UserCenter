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
		setUpViews()
    }

	func setUpViews() {
		
//		let topV:MainTopView = Bundle.main.loadNibNamed("MainTopView", owner: nil, options: nil)?.last as! MainTopView
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
		collectionV.register(UICollectionViewCell().classForCoder, forCellWithReuseIdentifier: ViewController.reuserIdentityId)
		collectionV.showsHorizontalScrollIndicator = false
		
		self.view.addSubview(collectionV)
		
		collectionV .scrollToItem(at: IndexPath.init(row: 1, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.reuserIdentityId, for: indexPath)
		if indexPath.row == 0 {
			cell.contentView.backgroundColor = UIColor.red
		}else if indexPath.row == 1{
			cell.contentView.backgroundColor = UIColor.orange
		}else{
			cell.contentView.backgroundColor = UIColor.green
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
		
	}
	func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
	}
	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		
		let tag = scrollView.contentOffset.x / Screen_width
		print("tag = \(tag)")
		self.topV.slide(tag:Int(tag))
	}
}

