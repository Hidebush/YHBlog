//
//  YHHomeViewController.swift
//  YHBlog
//
//  Created by Theshy on 16/8/2.
//  Copyright © 2016年 郭月辉. All rights reserved.
//

import UIKit

class YHHomeViewController: YHBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriend))
    }
    
    override func loadData() {
        print("开始刷新")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            
            self.refreshControl?.endRefreshing()
            print("刷新表格")
            self.tableView?.reloadData()
        }
        
    }
    
    @objc private func showFriend() {
        print(#function)
        
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
