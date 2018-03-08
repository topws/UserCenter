//
//  Utils.swift
//  SQSwiftRefresh
//
//  Created by Avazu Holding on 2018/3/8.
//  Copyright © 2018年 Avazu Holding. All rights reserved.
//

import Foundation

struct PullToRefreshKitConst{
	//kvo
	static let kPathOffSet = "contentOffset"
	static let kPathPanState = "state"
	static let kPathContentSize = "contentSize"
	
	//Default const
	static let defaultHeaderHeight:CGFloat = 50.0
	static let defaultFooterHeight:CGFloat = 44.0
	static let defaultLeftWidth:CGFloat = 50.0
	static let defaultRightWidth:CGFloat = 50.0
	
	//tags
	static let headerTag = 100001
	static let footerTag = 100002
	static let leftTag = 100003
	static let rightTag = 100004
}

func PTRLocalize(_ string:String)->String {
	//Bundle(for:class) 获取当前类的NSBundle
	return NSLocalizedString(string, tableName: "Localize", bundle: Bundle.main, value: "", comment: "")
}

struct PullToRefreshKitHeaderString {
	static let pullDownToRefresh = PTRLocalize("pullDownToRefresh")
	static let releaseToRefresh = PTRLocalize("releaseToRefresh")
	static let refreshSuccess = PTRLocalize("refreshSuccess")
	static let refreshFailure = PTRLocalize("refreshFailure")
	static let refreshing = PTRLocalize("refreshing")
}
struct PullToRefreshKitFooterString {
	static let pullUpToRefresh = PTRLocalize("pullUpToRefresh")
	static let refreshing = PTRLocalize("refreshing")
	static let noMoreData = PTRLocalize("noMoreData")
	static let tapToRefresh = PTRLocalize("tapToRefresh")
	static let scrollAndTapToRefresh = PTRLocalize("scrollAndTapToRefresh")
}
struct PullToRefreshKitLeftString{
	static let scrollToClose = "滑动结束浏览"
	static let releaseToClose = "松开结束浏览"
}

struct PullToRefreshKitRightString{
	static let scrollToViewMore = "滑动浏览更多"
	static let releaseToViewMore = "滑动浏览更多"
}
