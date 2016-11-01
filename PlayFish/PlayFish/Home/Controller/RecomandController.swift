//
//  RecomandController.swift
//  PlayFish
//
//  Created by sun on 2016/10/29.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit
fileprivate  let kCellMargin:CGFloat = 10
fileprivate  let kScreenW = UIScreen.main.bounds.size.width
private let kCellFirstSecId = "kCellFirstSecId"
private let kCellHeaderId = "kCellHeaderId"
private  let kCellW = (kScreenW - 3 * kCellMargin) / 2
private  let kCellH = kCellW * 3 / 4
private  let kCellTeH = kCellW * 4 / 3
class RecomandController: UIViewController {

    

 
    
    
    lazy var collectView:UICollectionView = {[unowned self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kCellW, height: kCellH)
        
        
        layout.minimumLineSpacing  = 0
        layout.minimumInteritemSpacing = kCellMargin
        layout.sectionInset = UIEdgeInsets(top: 0, left: kCellMargin, bottom: 0, right: kCellMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: 60)
        let coll = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        coll.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        coll.backgroundColor = UIColor.red
        coll.dataSource = self
        coll.delegate = self
        
        coll.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellFirstSecId)
        
        return coll
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectView.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: kCellHeaderId)
        view.backgroundColor = UIColor.blue
        
        view.addSubview(collectView)
    }


}




// MARK: -UICollectionViewDataSource
extension RecomandController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        }
        
        return 10
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kCellHeaderId, for: indexPath)
        
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectView.dequeueReusableCell(withReuseIdentifier: kCellFirstSecId, for: indexPath)
            cell.backgroundColor = UIColor.orange
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        switch indexPath.section {
        case 0:
            return CGSize(width:kCellW , height:kCellH)
            
        case 1:
            return CGSize(width:kCellW , height:kCellTeH)
            
        default:
            return CGSize(width:kCellW , height:kCellH)
        }
    }
    
    
}





