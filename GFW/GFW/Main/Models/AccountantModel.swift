//
//  AccountantModel.swift
//  GFW
//
//  Created by Avazu Holding on 2018/2/26.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import UIKit
import HandyJSON
import Alamofire

class AccountantModel: NSObject {

	
}

struct responseModel: HandyJSON{
	var data:[TagModel]?
	var error: Int!
}

struct TagModel: HandyJSON{
	var nickname: String?
	var vertical_src: String?
	var ranktype: String?
	var room_src: String?
	var cate_id: Int?
}


