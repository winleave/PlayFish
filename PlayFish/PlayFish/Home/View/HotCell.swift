//
//  HotCell.swift
//  PlayFish
//
//  Created by sun on 2016/11/3.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit
import Kingfisher
class HotCell: UICollectionViewCell {
    
    fileprivate var titleLabel:UILabel?
    fileprivate var bgImageView:UIImageView?
    fileprivate var attenCountLable:UILabel?
    
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
            attenCountLable?.text = onlineStr
            
            titleLabel?.text = anchorModel?.nickname
            
            guard let iconURL = URL(string: anchor.vertical_src) else { return }
            
            bgImageView?.kf.setImage(with: iconURL)
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tilteLable = UILabel()
        addSubview(tilteLable)
        tilteLable.textColor = UIColor.black
        tilteLable.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(36)
        })
        tilteLable.text = "这是测试嗯嗯嗯嫩"
        self.titleLabel = tilteLable
        
        let bgImageView = UIImageView()
        bgImageView.layer.cornerRadius = 5
        bgImageView.layer.masksToBounds = true
        addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.contentView)
            make.bottom.equalTo(tilteLable.snp.top)
            
        }
        
        bgImageView.image = UIImage(named: "Img_default")
       self.bgImageView = bgImageView
        
        let countLable = UILabel()
        countLable.textColor = UIColor.white
        countLable.text = "22.7万"
        addSubview(countLable)
        countLable.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(6)
            make.right.equalTo(self.contentView.snp.right).offset(-6)
            
        }
        self.attenCountLable = countLable
        
        let countImagev = UIImageView()
        
        addSubview(countImagev)
        countImagev.snp.makeConstraints { (make) in
            make.right.equalTo(countLable.snp.left).offset(-6)
            make.top.bottom.equalTo(countLable)
            make.width.equalTo(10)
        }
        countImagev.image = UIImage(named: "ico_location")
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
