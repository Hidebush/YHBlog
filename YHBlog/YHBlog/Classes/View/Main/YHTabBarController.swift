//
//  YHTabBarController.swift
//  YHBlog
//
//  Created by Theshy on 16/8/2.
//  Copyright © 2016年 郭月辉. All rights reserved.
//

import UIKit

class YHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension YHTabBarController {
    // MRAK: - 设置子控制器
    private func setupChildControllers() {
        
    }
    
    
    /// 使用字典生成一个控制
    ///
    /// - parameter dict: 信息字典 [clsName, title, imageName]
    ///
    /// - returns: 子控制器
    private func controller(dict: [String: String]) -> UIViewController {
        guard let clsName = dict["clsName"],
        let title = dict["title"],
        let imageName = dict["imageName"],
        let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type
            else {
            return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
//        vc.tabBarItem.image
        
        let nav = YHNavController(rootViewController: vc)
        
        return nav
    }
}




