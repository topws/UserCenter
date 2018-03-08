//
//  TimeModuleCell.swift
//  GFW
//
//  Created by Avazu Holding on 2018/2/26.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import HandyJSON
import RainyRefreshControl
import PullToRefreshKit
class TestModel: HandyJSON{
	
	var age:Int?
	var name:String!
	var sex:String?
	
	required init(){}
}

class TimeModuleCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource {
	
	//data
	lazy var models : Array<TagModel> = {
		return Array.init()
	}()
	
	lazy var str:String = {
		let str = "hello"
		return str
	}()
	var tableView : UITableView?
	let refresh = RainyRefreshControl()
	
	//def block
	typealias nothing = ()->()
	typealias oneParamters = (String)->()
	typealias oneReturnValue = ()->(String)
	typealias AllValue = (Int,String)->(String)
	typealias ClickCellBlock = (NSInteger)->()
	
	let a = 5
	var testBlock:AllValue = {
		(first:Int,second:String)-> (String) in
		return second + (NSString.init(format: "%d", first) as String)
	}
	
	var clickCellBlock:ClickCellBlock?
	
	//Main
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		let tab = UITableView.init(frame: self.contentView.bounds, style: UITableViewStyle.plain)
		self.tableView = tab
		self.addSubview(tab)
		
		tab.snp.makeConstraints { (make) in
			make.edges.equalTo(self.contentView)
		}
		tab.delegate = self;
		tab.dataSource = self
		tab.separatorStyle = UITableViewCellSeparatorStyle.singleLine
		tab.separatorInset = UIEdgeInsets.zero
		tab.separatorColor = UIColor.red
		tab.register(UINib.init(nibName: "LeftTabCell", bundle: nil), forCellReuseIdentifier: "LeftTabCell")
		
		//get data
		self.getData()
		self.test1()
		self.test2()
		
		refresh.addTarget(self, action: #selector(TimeModuleCell.doRefresh), for: .valueChanged)
		tab.addSubview(refresh)
		
		let result = testBlock(a,str)
		
		let b:Int? = Int(result)
		print("测试Block输出结果=\(result),,\(b ?? 0)")
		
		tab.configRefreshFooter(with: DefaultRefreshFooter.footer()) {
			self.loadMoreData()
			DispatchQueue.main.asyncAfter(deadline: .now()+2.0, execute: {
				self.tableView?.switchRefreshFooter(to: FooterRefresherState.normal)
			})
		}
    }

	@objc func doRefresh(){
		print("doRefresh")
		self.getData()
		DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute:
			{
				self.refresh.endRefreshing()
		})
	}
	func loadMoreData(){
		print("load more data")
	}
	
	
	//UITableViewDelegate
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "LeftTabCell") as! LeftTabCell
		//		let str = "100"
		//		let number = (str as NSString).intValue
		cell.titleLB.text = NSString.init(format: "%d--%@", indexPath.row,models[indexPath.row].nickname!) as String
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.1
	}
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView.init()
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		clickCellBlock!(indexPath.row)
	}
}
extension TimeModuleCell {
	
	fileprivate func getData() {
		let rec_collectionurl = "http://capi.douyucdn.cn/api/v1/getbigDataRoom?aid=ios&client_sys=ios&time=1468636740&token=30890623_1b036814902f6451&auth=7d7026a323e09dd55c71ca215fc9d4b2";
		Alamofire.request(rec_collectionurl, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseString { (response) in
			
			if response.result.isSuccess {
				if let jsonString = response.result.value {
					
					self.models.removeAll()
					//json -> model
					if let responseModel = responseModel.deserialize(from: jsonString) {
						
						//model 转 json  为了方便在控制台查看
						print(responseModel.toJSONString(prettyPrint: true)!)
						
						// 遍历responseModel.data
						responseModel.data?.forEach({ (model) in
							print(model.nickname!);
							self.models.append(model)
							self.tableView?.reloadData()
						})
						
						
					}
				}
			}
		}
	}
}

extension TimeModuleCell {
	//反序列化/*
	fileprivate func test1(){
		
		let jsonString = "{\"age\":24,\"name\":\"Micheal\",\"sex\":\"男\"}"
		//json 转 model
		guard let model = TestModel.deserialize(from: jsonString) else {
			return
		}
		print(model.name)
		print(model.age!)
		print(model.sex!)
	}
	
	//序列化/*
	fileprivate func test2(){
		
		let model = TestModel()
		model.name = "Mike"
		model.age = 18
		model.sex = "男"
		
		print(model.toJSON()!)
		print(model.toJSONString()!)
		print(model.toJSONString(prettyPrint: true)!)
		
	}
	
}
