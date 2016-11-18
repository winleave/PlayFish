//
//  PYNetworkTool.swift
//  PlayFish
//
//  Created by sun on 2016/11/1.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit
import Alamofire
enum NetType {
    case GET
    case POST
    
    
}

class PYNetworkTool {

    class func requeset(type:NetType,urlString:String,paraters:[String:Any]? = nil,finishedCallBack:@escaping (_ result:Any)->()){
        var netType:HTTPMethod?
        switch type {
        case NetType.GET:
            netType = HTTPMethod.get
        case NetType.POST:
            netType = HTTPMethod.post
        default: netType = HTTPMethod.get
            
        }
        
        Alamofire.request(urlString, method: netType!, parameters: paraters).responseJSON(completionHandler: { (response) in
            guard let respon = response.result.value else{
                print(response.result.error ?? "")
                return
            }
            
            
            finishedCallBack(respon)
        })
        
        
    }
    
    
    
    
    
    
}
