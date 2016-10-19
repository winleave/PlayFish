//
//  HomeController.swift
//  PlayFish
//
//  Created by sun on 2016/10/8.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

class HomeController: PFBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        setupUI()
        
        
        
        
       
    }

    
}
//UI
extension HomeController {
    
    fileprivate func setupUI() {
        
       navigationItem.leftBarButtonItem = UIBarButtonItem(Image: "logo")
        
        let itemSize = CGSize(width: 40, height: 40)
       let hitstory = UIBarButtonItem(Image: "image_my_history", selectImage: "Image_my_history_click", size: itemSize)
       let qrcode = UIBarButtonItem(Image: "Image_scan", selectImage: "Image_scan_click", size: itemSize)
       let find = UIBarButtonItem(Image: "btn_search", selectImage: "btn_search_clicked", size: itemSize)
        
        navigationItem.rightBarButtonItems = [find,qrcode,hitstory]
    }
    
    
    
    
   
    
}
