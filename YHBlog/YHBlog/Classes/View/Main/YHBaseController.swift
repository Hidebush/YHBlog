//
//  YHBaseController.swift
//  YHBlog
//
//  Created by Theshy on 16/8/2.
//  Copyright © 2016年 郭月辉. All rights reserved.
//

import UIKit

class YHBaseController: UIViewController {

    var userLogon: Bool = false
    var isPullUp: Bool = false
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?
    lazy var navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 64))
    
    lazy var navItem: UINavigationItem = UINavigationItem()
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    // 子类实现其方法
    func loadData() {
        refreshControl?.endRefreshing()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


extension YHBaseController {
    func setupUI() {
        view.addSubview(navigationBar)
        setupNavBar()
        userLogon ? setupTableView() : setupUserVisiterView()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height,
                                               left: 0,
                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
                                               right: 0)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        
        // 添加refreshControl
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    private func setupUserVisiterView() {
        let visitorView = YHVisitorView(frame: view.bounds)
        view.insertSubview(visitorView, belowSubview: navigationBar)
    }
    
    func setupNavBar() {
        navigationBar.items = [navItem]
        navigationBar.barTintColor = UIColor.yh_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
    
}

extension YHBaseController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        if row == count - 1 && !isPullUp {
            print("上拉刷新")
            
            isPullUp = true
            loadData()
        }
        
    }
}


