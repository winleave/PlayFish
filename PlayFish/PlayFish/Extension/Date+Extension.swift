//
//  Date+Extension.swift
//  PlayFish
//
//  Created by sun on 2016/11/5.
//  Copyright © 2016年 sun. All rights reserved.
//

import Foundation

extension Date{
    static func getCurrentTime() -> String{
        
        let nowDate = Date()
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
        
    }
    
    
    
    
    
}
