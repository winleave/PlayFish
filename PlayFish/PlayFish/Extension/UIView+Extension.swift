//
//  UIView+Extension.swift
//  PlayFish
//
//  Created by sun on 2016/10/19.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit
extension UIView {
    
    var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set(new){
            var  temp = self.frame
            temp.origin.x = new
            self.frame = temp
        }
    }
    
    
    var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        set(new){
            var temp = self.frame
            temp.origin.y = new
            self.frame = temp
        }
    }
    
    
    var width:CGFloat {
        get {
            return self.frame.size.width
        }
        set(new){
            var temp = self.frame
            temp.size.width = new
            self.frame = temp
            
        }
    }
    
    var height:CGFloat{
        get {
            return self.frame.size.height
        }
        
        set(new){
            var temp = self.frame
            temp.size.height = new
            self.frame = temp
        }
    }
    
    var centerX:CGFloat{
        get {
            return self.center.x
        }
        set(new){
            var temp = self.center
            temp.x =  new
            self.center = temp
        }
    }
    
    
    var centerY:CGFloat{
        get {
            return self.center.y
        }
        set(new){
            var temp = self.center
            temp.y = new
            self.center = temp
        }
    }
}
