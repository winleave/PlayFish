//
//  PrettyCell.swift
//  PlayFish
//
//  Created by sun on 2016/11/3.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit

class PrettyCell: UICollectionViewCell {
    
    
    var anchorModel:AnchorModel?{
        didSet{
            
            guard let anchor = anchorModel else{
                return
            }
            
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            nameLabel.text = anchor.nickname
            
            guard let iconURL = URL(string: anchor.vertical_src) else { return }
            
            bgImaageView.kf.setImage(with: iconURL)
            
        }
    }
    
    lazy var bgImaageView:UIImageView = {
       let imV = UIImageView()
        imV.layer.cornerRadius = 5
        imV.layer.masksToBounds = true
        imV.image = UIImage(named: "live_cell_default_phone")
        return imV
    }()
    
    lazy var onlineBtn:UIButton = {
       let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.gray
        btn.setTitle("6666在线", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        return btn
    }()
    
    lazy var nameLabel:UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "hahhhahahha"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.height.equalTo(16)
        }
        addSubview(bgImaageView)
        bgImaageView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(nameLabel.snp.top).offset(-6)
        }
        
        addSubview(onlineBtn)
        onlineBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(8)
            make.right.equalTo(self.snp.right).offset(-8)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
