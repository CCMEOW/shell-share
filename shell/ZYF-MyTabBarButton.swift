//
//  ZYF-MyTabBarButton.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/23.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ZYF_MyTabBarButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 49, height: 49)
        self.setTitleColor(UIColor.gray, for: .normal)
        self.setTitleColor(UIColor.red, for: .selected)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        self.titleLabel?.textAlignment = .center
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //重写button中图片的位置
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: (contentRect.size.width - 30) / 2, y: 2, width: 30, height: 30)
    }
    //重写button中文本框的位置
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: contentRect.size.height - 17, width: contentRect.size.width, height: 15)
    }
    convenience init(frame: CGRect,image:String) {
        self.init(frame:frame)
        let imageView = UIImageView(frame: CGRect(x: 0,y: 0,width: 70,height: 70))
        imageView.image = UIImage(named: image)
        self.addSubview(imageView)
    }
}
