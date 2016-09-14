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

        setupChildControllers()
        setupComposeBtn()
    
    }
    
    
    func composeBtnClick() {
        print("发布微博")
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
    }
    
    @objc private func buttonClick() {
        print(#function)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    lazy var composeBtn: UIButton = UIButton.yh_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension YHTabBarController {
    
    // MARK: - 设置加号按钮
    func setupComposeBtn() {
        tabBar.addSubview(composeBtn)
        
        // FIXME: 减去1 是因为 tabbar 容错点  中间按钮点击区域小  减去一可以增大点击区域
        let w: CGFloat = tabBar.bounds.size.width / CGFloat(viewControllers!.count) - 1
        // FIXME: 此处设置frame 可以参考
        composeBtn.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        composeBtn.addTarget(self, action: #selector(composeBtnClick), for: UIControlEvents.touchUpInside)
    }
    
    // MRAK: - 设置子控制器
    func setupChildControllers() {
        let array = [
            ["clsName": "YHHomeViewController", "title": "首页", "imageName": "home"],
            ["clsName": "YHMessageViewController", "title": "消息", "imageName": "message_center"],
            ["clsName": ""],
            ["clsName": "YHDiscoverViewController", "title": "发现", "imageName": "discover"],
            ["clsName": "YHProfileViewController", "title": "我", "imageName": "profile"]
        ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
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
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: UIControlState.highlighted)
        let nav = YHNavController(rootViewController: vc)
        
        return nav
    }
}




