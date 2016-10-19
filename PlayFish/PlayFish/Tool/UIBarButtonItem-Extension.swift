//
//  UIBarButtonItem-Extension.swift
//  PlayFish
//
//  Created by sun on 2016/10/8.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
   convenience init(Image:String,selectImage:String = "",size:CGSize = CGSize.zero) {
    

        let btn = UIButton(type: .custom)
        let img = UIImage(named: Image)
        btn.setImage(img, for: .normal)
        if selectImage != "" {
        btn.setImage(UIImage(named: selectImage), for: .highlighted)
        }

        if size == CGSize.zero {
        btn.sizeToFit()
        }else{
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }

        self.init(customView:btn)

        
    }
    
    
    
    
}

