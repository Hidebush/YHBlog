//
//  UIBarButtonItem+Extension.swift
//  YHBlog
//
//  Created by Theshy on 16/8/7.
//  Copyright © 2016年 郭月辉. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject?, action: Selector, isBack: Bool = false) {
        let btn: UIButton = UIButton.yh_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage(named: imageName), for: UIControlState.normal)
            btn.setImage(UIImage(named: imageName + "_highlighted"), for: UIControlState.highlighted)
            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }
}
