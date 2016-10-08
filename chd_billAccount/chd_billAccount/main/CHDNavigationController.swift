//
//  CHDNavigationController.swift
//  MobileReceipt
//
//  Created by 崔海达 on 16/2/25.
//  Copyright © 2016年 com.yonyou.nc. All rights reserved.
//

import UIKit
var navBarH:CGFloat = 0.0
class CHDNavigationController: UINavigationController {
    /**
     当第一次使用这个类的时候会调用一次
     */
    override class func initialize()
    {
        let navbarTitleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        let bar = UINavigationBar.appearance()
        bar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: .Default)
        
        bar.titleTextAttributes = navbarTitleTextAttributes
        bar.tintColor = UIColor.whiteColor()
    }
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }
//    
   required override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
       super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarH = self.navigationBar.height + 20
        
        }
    
    
    
    /**
     可以在这个方法中拦截所有push进来的控制器

     */
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0
        {
         
            let button = UIButton(type: .Custom)
            button.setTitle("返回", forState: .Normal)
            button.setImage(UIImage(named: "navigationButtonReturn"), forState: .Normal)
            button.setImage(UIImage(named: "navigationButtonReturn"), forState: .Highlighted)
            button.size = CGSizeMake(70, 30)
            // 让按钮内部的所有内容左对齐
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            //        [button sizeToFit];
            // 让按钮的内容往左边偏移10
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
            button.addTarget(self, action: #selector(self.back), forControlEvents: .TouchUpInside)
            // 修改导航栏左边的item
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            // 隐藏tabbar
//            viewController.hidesBottomBarWhenPushed = true;
        }
        // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
        super.pushViewController(viewController, animated: animated)
    }
    /**
     点击返回后弹出栈顶控制器
     */
    func back()
    {
        self.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
