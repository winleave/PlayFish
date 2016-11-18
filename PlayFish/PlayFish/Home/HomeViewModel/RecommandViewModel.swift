//
//  RecommandViewModel.swift
//  PlayFish
//
//  Created by sun on 2016/11/5.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

class RecommandViewModel {
   
    lazy var anchorGroups:[AnchorGroup] = [AnchorGroup]()
    
    fileprivate lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    fileprivate lazy var prettyGroup : AnchorGroup  = AnchorGroup()
    
    
    
    
}

extension RecommandViewModel{
    
    func loadNetRecomData(_ finished:@escaping ()->()){
        
        let parameters = ["limit":"4","offset":"0","time":Date.getCurrentTime()]
        
        let dGourp = DispatchGroup()
        
        
        
        dGourp.enter()
        PYNetworkTool.requeset(type: NetType.GET, urlString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", paraters: ["time" : Date.getCurrentTime() as NSString], finishedCallBack: {
            (result) in
            
            guard let resultDict = result as? [String:Any] else{
                return
            }
            
            
            guard let dataArr = resultDict["data"] as? [[String:Any]] else {
                return
            }
            
            
            
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            for dict in dataArr {
                let anchorModel = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchorModel)
            }
            
            dGourp.leave()
            
        })
        
        
        
        
        dGourp.enter()
        
        PYNetworkTool.requeset(type: .GET, urlString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", paraters: parameters as [String : NSString]?, finishedCallBack:{
            (result) in
            
            
            guard let dataDict  = result as? [String:Any] else{
                return
            }
            
            guard let dataArr = dataDict["data"] as? [[String:Any]] else{
                return
            }
            
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            for dict in dataArr {
                let anchorModel = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchorModel)
            }
            
            dGourp.leave()
        })
        
        dGourp.enter()
            
        PYNetworkTool.requeset(type: .GET, urlString: "http://capi.douyucdn.cn/api/v1/getHotCate", paraters: parameters, finishedCallBack: { (result) in
            
            
            guard let dataDict  = result as? [String:Any] else{
                return
            }
            
            guard let dataArr = dataDict["data"] as? [[String:Any]] else{
                return
            }
            
            for dict in dataArr{
                let anchorGroup = AnchorGroup(dict: dict)
                //着一大坑,后台返回的数据颜值数据是空的.
                if anchorGroup.tag_name == "颜值" {
                    continue
                }
                self.anchorGroups.append(anchorGroup)
            }
            
            dGourp.leave()
            
        })
        
        dGourp.notify(queue: DispatchQueue.main, execute:{
        
        print("回到主线程,结束了\(self.anchorGroups.count)")
        self.anchorGroups.insert(self.prettyGroup, at: 0)
        self.anchorGroups.insert(self.bigDataGroup, at: 0)
          
          let cacheTool =  PYCacheTool()
            cacheTool.savaData(dataArr: self.anchorGroups)
            
        finished()
            
            
        
        }
        
        
        
        )
        
    }
    
    
    
}
