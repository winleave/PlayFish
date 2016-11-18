//
//  AnchorGroup.swift
//  PlayFish
//
//  Created by sun on 2016/11/6.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject {

    
    lazy var anchors:[AnchorModel] = [AnchorModel]()
    
    var room_list :[[String:Any]]? {
        didSet{
            guard let room_list = room_list else{
                return
            }
            for dict in room_list{
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    
    
    /// 组显示的图标
    var icon_name : String = "home_header_normal"
    /// 组显示的标题
    var tag_name : String = ""
    /// 游戏对应的图标
    var icon_url : String = ""
    
    override init() {
        super.init()
    }
    
    init(dict:[String:Any]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
