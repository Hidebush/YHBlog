//
//  Bundle+Extension.swift
//  YHBlog
//
//  Created by Theshy on 16/8/3.
//  Copyright © 2016年 郭月辉. All rights reserved.
//

import Foundation

extension Bundle {
    
    // 计算型属性返回
    var nameSpace: String {
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
