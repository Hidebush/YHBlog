//
//  YHVisitorView.swift
//  YHBlog
//
//  Created by Theshy on 16/9/7.
//  Copyright © 2016年 郭月辉. All rights reserved.
//

import UIKit

class YHVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension YHVisitorView {
    func setupUI() {
        backgroundColor = UIColor.white
        
    }
    
}
