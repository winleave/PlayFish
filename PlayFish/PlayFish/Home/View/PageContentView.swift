//
//  PageContentView.swift
//  PlayFish
//
//  Created by sun on 2016/10/21.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit


protocol pageContentDelegate:class {
    func pageContentDidScrollIndex(_ index:Int)
}
class PageContentView: UIView {
     var childsVc:[UIViewController]
     var parentVc:UIViewController
    weak var delegate:pageContentDelegate?
    lazy var vcContentView:UICollectionView = {[unowned self] in
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let content = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        content.dataSource = self
        
        content.delegate = self
        
        
        return content
    }()
    
    init(frame: CGRect , vcs:[UIViewController],parentController:UIViewController) {
        self.childsVc = vcs
        self.parentVc = parentController
        
        
        super.init(frame: frame)
        //setupUI
        
        
        
        for vc in childsVc{
            parentVc.addChildViewController(vc)
        }
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PageContentView{
    
    fileprivate func setupUI(){
        vcContentView.frame = self.bounds
        vcContentView.isPagingEnabled = true
        vcContentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        vcContentView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        addSubview(vcContentView)
        
       
    }
    
    
    
}


// MARK:-UICollectionViewDataSource
extension PageContentView:UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.childsVc.count
    }
    
    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        let vc = self.childsVc[indexPath.item]
        vc.view.frame = cell.bounds
        
        cell.contentView.addSubview(vc.view)
            
        
        
        return cell
    }
}

extension PageContentView{
    
    func scrollPageToIndex(_ index:Int){
        let point = CGPoint(x: CGFloat(index) * self.bounds.size.width, y: 0)
        vcContentView.setContentOffset(point, animated: false)
        
        
    }
    
}
extension PageContentView:UICollectionViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        
        let index = offsetX / self.bounds.size.width
        
        print(Int(index))
        self.delegate?.pageContentDidScrollIndex(Int(index))
        
    }
    
    
    
}




