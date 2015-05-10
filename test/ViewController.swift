//
//  ViewController.swift
//  test
//
//  Created by goofygao on 5/10/15.
//  Copyright (c) 2015 goofygao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITabBarDelegate {
    
    //添加Tab Bar控件
    var tabBar:UITabBar!
    //Tab Bar Item的名称数组
    var tabs = ["公开课","全栈课","设置"]
    //Tab Bar上方的容器
    var contentView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //在底部创建Tab Bar
        tabBar = UITabBar(frame:
            CGRectMake(0,CGRectGetHeight(self.view.bounds)-64,CGRectGetWidth(self.view.bounds),44))
        var items:[UITabBarItem] = []
        for tab in self.tabs {
            var tabItem = UITabBarItem()
            tabItem.title = tab
            items.append(tabItem)
        }
        //设置Tab Bar的标签页
        tabBar.setItems(items, animated: true)
        //本类实现UITabBarDelegate代理，切换标签页时能响应事件
        tabBar.delegate = self
        //代码添加到界面上来
        self.view.addSubview(tabBar);
        
        //上方的容器
        contentView = UIView(frame:
            CGRectMake(0,0,CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds)-44))
        self.view.addSubview(contentView)
        var lbl = UILabel(frame:CGRectMake(100,200,100,20))
        //定义tag，在用户切换tab时能查询到label控件
        lbl.tag = 1
        contentView.addSubview(lbl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITabBarDelegate协议的方法，在用户选择不同的标签页时调用
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        //通过tag查询到上方容器的label，并设置为当前选择的标签页的名称
        (contentView.viewWithTag(1) as! UILabel).text = item.title
    }
}
