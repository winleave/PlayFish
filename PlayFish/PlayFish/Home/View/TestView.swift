//
//  TestView.swift
//  PlayFish
//
//  Created by sun on 2016/10/20.
//  Copyright © 2016年 sun. All rights reserved.
//

import UIKit
import SnapKit

protocol TestViewDelegate:class {
    func testViewDidSelect(_:Int)
}

class TestView: UIView {
    weak var delegate:TestViewDelegate?
    lazy var bottomLine:UIView = {
        let bottom = UIView()
        bottom.backgroundColor = UIColor.orange
        return bottom
    }()
    
    //选中的label
    var selectLabel:UILabel?
    var didSelectLabel:UILabel?
    //所有label
    var labels:[UILabel] = [UILabel]()
    
   fileprivate  var titles:[String]
    
    init(frame: CGRect , tiltes:[String]) {
        
        self.titles = tiltes
        
        super.init(frame:frame)
        self.backgroundColor = UIColor.white
        //设置UI约束
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TestView{
    
     func setupUI(){
        
        
        
        
        let lableW:CGFloat = UIScreen.main.bounds.size.width / CGFloat(self.titles.count)
        
        for (index,title) in self.titles.enumerated(){
            let label = UILabel()
            
            label.text = title
            label.textColor = UIColor.black
            label.textAlignment  = .center
            label.tag = index
            labels.append(label)
            label.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer()
            
            tap.addTarget(self, action: #selector(titleSelect(tap:)))
            label.addGestureRecognizer(tap)
            addSubview(label)
            if index == 0 {
                label.snp.makeConstraints({ (make) in
                    make.left.top.bottom.equalTo(self)
                    make.width.equalTo(lableW)
                })
                label.textColor = UIColor.orange
                didSelectLabel = label
            }else{
                
                let suLabel = self.subviews[index - 1]
                
                label.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(suLabel.snp.right)
                    make.top.bottom.equalTo(self)
                    make.width.equalTo(lableW)
                })
            }
        }
        
        
        bottomLine.frame = CGRect(x: 0, y: self.height - 2, width: lableW, height: 1.5)
        addSubview(bottomLine)
       
        let grayLine = UIView()
        grayLine.backgroundColor = UIColor.gray
        addSubview(grayLine)
        grayLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(0.5)
        }
        
}
    
    
    
    
    
}
extension TestView{
    
    
    @objc fileprivate func titleSelect(tap:UITapGestureRecognizer){
        
        guard let label = tap.view as? UILabel else{
            return
        }
        delegate?.testViewDidSelect(label.tag)
        self.selectLabel(label: label)
        
    }
    
    
    
    
    func setTitleSelect(_ titleIndex:Int){
        
        print(self.labels.count)
        print(titleIndex )
        let label = self.labels[titleIndex]
        print(label.tag)
        
        self.selectLabel(label: label)
        
        
        
    }
    
    
    fileprivate func selectLabel(label:UILabel){
        
        
        
        didSelectLabel?.textColor = UIColor.black
        label.textColor = UIColor.orange
        
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.bottomLine.frame = CGRect(x: label.x, y: self.height - 2, width: label.width, height: 1.5)
            
        }) { (isSuccces) in
            
        }
        didSelectLabel = label
        
        
        
        
    }
    
}
    
    
    






