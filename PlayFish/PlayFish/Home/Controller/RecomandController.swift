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
private let kCellSecondId = "PrettyCell"
private let kCellHeaderId = "kCellHeaderId"
private  let kCellW = (kScreenW - 3 * kCellMargin) / 2
private  let kCellH = kCellW * 3 / 4
private  let kCellTeH = kCellW * 4 / 3
class RecomandController: UIViewController {

    

 
    fileprivate lazy var recommandViewModel:RecommandViewModel = {
       let recVM = RecommandViewModel()
        
        return recVM
    }()
    
    
    
    lazy var collectView:UICollectionView = {[unowned self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kCellW, height: kCellH)
        
        
        layout.minimumLineSpacing  = 0
        layout.minimumInteritemSpacing = kCellMargin
        layout.sectionInset = UIEdgeInsets(top: 0, left: kCellMargin, bottom: 0, right: kCellMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: 60)
        let coll = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        coll.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        coll.backgroundColor = UIColor.white
        coll.dataSource = self
        coll.delegate = self
        
        coll.register(HotCell.self, forCellWithReuseIdentifier: kCellFirstSecId)
        coll.register(PrettyCell.self, forCellWithReuseIdentifier:kCellSecondId)
        
        return coll
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectView.register(CollectionViewHeaderView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: kCellHeaderId)
        
        
        view.addSubview(collectView)
        
        recommandViewModel.loadNetRecomData { 
            self.collectView.reloadData()
        }
    }


}




// MARK: -UICollectionViewDataSource
extension RecomandController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        
        return self.recommandViewModel.anchorGroups.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = recommandViewModel.anchorGroups[section]
        
        return group.anchors.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kCellHeaderId, for: indexPath) as! CollectionViewHeaderView
        let group = recommandViewModel.anchorGroups[indexPath.section]
        
        
        
        header.group = group
        
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
            let group = recommandViewModel.anchorGroups[indexPath.section]
        
            let anchor = group.anchors[indexPath.item]
            
        
            let cell = collectView.dequeueReusableCell(withReuseIdentifier: kCellFirstSecId, for: indexPath) as! HotCell
            cell.anchorModel = anchor
            let pretyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellSecondId, for: indexPath) as! PrettyCell
        if indexPath.section == 1 {
            pretyCell.anchorModel = anchor
            return pretyCell
        }
            
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





