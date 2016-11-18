//
//  PYCacheTool.swift
//  PlayFish
//
//  Created by sun on 2016/11/7.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

class PYCacheTool {
    
    let db:FMDatabase = {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String
        
        let path = dir.appending("/anchorsGroup.db")
        
        let db = FMDatabase(path: path)
        
        print(path)
        return db!
    }()
    
     func savaData(dataArr:[AnchorGroup]){
        
        if db.open(){
            
         let createTable = "create table if not exists ImgInfo(Id integer primary key autoincrement,picName varchar(256),picPath varchar(256),FID varchar(256),userID varchar(256))"
            let isSuceess =  db.executeStatements(createTable)
            if isSuceess {
                print("创表成功")
            }
        }
        
        
        
        
    }
    
    
    
    
}
