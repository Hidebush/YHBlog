//
//  YHNavController.swift
//  YHBlog
//
//  Created by Theshy on 16/8/2.
//  Copyright © 2016年 郭月辉. All rights reserved.
//

import UIKit

class YHNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            if let vc = viewController as? YHBaseController {
                var title = "返回"
                
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent), isBack: true)
                
            }
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
    @objc private func popToParent() {
        popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
