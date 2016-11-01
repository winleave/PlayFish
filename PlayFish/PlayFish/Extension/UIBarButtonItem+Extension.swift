//
//  UIBarButtonItem+Extension.swift
//  PlayFish
//
//  Created by sun on 2016/10/19.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName:String , hightImage:String , size:CGSize = CGSize.zero){
        
        
        let btn = UIButton(type: .custom)
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if hightImage != "" {
            btn.setImage(UIImage(named:hightImage), for: .highlighted)
           }
        
        if size == CGSize.zero {
            
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        
        self.init(customView:btn);
        
    }
    
    
    
    
}
