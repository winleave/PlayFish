//
//  HomeController.swift
//  PlayFish
//
//  Created by sun on 2016/10/8.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

class HomeController: PFBaseController,TestViewDelegate {

    
    // MARK:-可以懒加载contentview,但是现在偷个懒把
    fileprivate var contentVcView:PageContentView?
    fileprivate var testView:TestView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        setupUI()
        automaticallyAdjustsScrollViewInsets = false
        let rect = CGRect(origin: CGPoint.init(x: 0, y: 64), size: CGSize.init(width: UIScreen.main.bounds.size.width, height: 40))
        let tV = TestView(frame: rect, tiltes: ["推荐","游戏","娱乐","趣玩"])
        self.testView = tV
        tV.delegate = self
        
        view.addSubview(tV)
        
       
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
        let width = view.bounds.size.width
        let heigth = view.bounds.size.height - 40
        let contentRect = CGRect(x: 0, y: 104, width: width, height: heigth-44)
        
        var vcs:[UIViewController] = [UIViewController]()
        
        
        
        let recVc = RecomandController()
        let vc = UIViewController()
        for i  in  0..<4{
            
            if i == 0{
                vcs.append(recVc)
            }else{
               vcs.append(vc)
            }
            
            
            
        }
        let content = PageContentView(frame: contentRect, vcs: vcs, parentController: self)
        content.delegate = self
        
        self.contentVcView = content
        
        view.addSubview(content)
        
    }
   
}

extension HomeController:pageContentDelegate{
    
    //// MARK:-testViewDelegate
    func testViewDidSelect(_ index: Int) {
        print("现在选中了\(index)的label")
        
        self.contentVcView?.scrollPageToIndex(index: index)
        
        
        
    }
    
    // MARK:- pageContentDelegate
    func pageContentDidScrollIndex(index: Int) {
        print("\(index)" + "滚到这了")
        self.testView?.setTitleSelect(titleIndex: index)
    }
}



