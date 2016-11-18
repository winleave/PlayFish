//
//  CollectionViewHeaderView.swift
//  PlayFish
//
//  Created by sun on 2016/11/4.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

class CollectionViewHeaderView: UICollectionReusableView {
    
    var group:AnchorGroup?{
        didSet{
            
            
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_phone")
            titleLabel.text = group?.tag_name
        }
    }
    
    fileprivate var iconImageView:UIImageView = {
       let iconView = UIImageView()
        iconView.image = UIImage(named: "home_header_phone")
        return iconView
    }()
    fileprivate var titleLabel:UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        return label
    }()
    fileprivate let moreBtn:UIButton = {
       let btn = UIButton(type:.custom)
        btn.setTitle("更多 >", for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .normal)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.right.left.equalTo(self)
            make.height.equalTo(10)
        }
        
        addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.top.equalTo(line.snp.bottom).offset(11)
            make.height.width.equalTo(18)
            
        }
        
        addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.iconImageView.snp.centerY)
            make.left.equalTo(self.iconImageView.snp.right).offset(5)
            
        }
        addSubview(self.moreBtn)
        self.moreBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-10)
            make.top.equalTo(line.snp.bottom).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.width.equalTo(60)
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
