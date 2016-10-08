//
//  PFTabBarController.swift
//  PlayFish
//
//  Created by sun on 2016/10/8.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

class PFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeVc = HomeController()
        setupSubs(vc: homeVc, title: "首页", imgName: "btn_home")
        
        let broadVc = BroadCastController()
        setupSubs(vc: broadVc, title: "直播", imgName: "btn_column")
        
        let attVc = AttentionController()
        setupSubs(vc: attVc, title: "关注", imgName: "btn_l_attention")
        
        let mineVc = MineController()
        setupSubs(vc: mineVc, title: "我的", imgName: "btn_user")
        
        
       
    }

    func setupSubs (vc:UIViewController,title:String,imgName:String) {
        
        vc.tabBarItem.title = title
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.black], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .selected)
        var img = UIImage(named: imgName + "_normal")
                img = img?.withRenderingMode(.alwaysOriginal)
                vc.tabBarItem.image = img
        
        var seletctImg = UIImage(named: imgName + "_selected")
        seletctImg = seletctImg?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.selectedImage = seletctImg
        
        let homeNav = PFNavigationController(rootViewController: vc)
        
        addChildViewController(homeNav)
        
        
    }
  
}


