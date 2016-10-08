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
        
        
        addChildViewController(homeVc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
