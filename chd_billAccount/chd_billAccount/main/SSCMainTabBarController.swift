//
//  CHDMainTabBarController.swift
//  MobileReceipt
//
//  Created by 崔海达 on 16/2/25.
//  Copyright © 2016年 com.yonyou.nc. All rights reserved.
//

import UIKit
var tabBarH:CGFloat = 0.0
class CHDMainTabBarController: UITabBarController,UITabBarControllerDelegate {
    
    override class func initialize()
    {
        // 通过appearance统一设置所有UITabBarItem的文字属性
        let attrs = [NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.grayColor()]
        
        let selectedAttrs = [NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor(red: 0.0/255.0, green: 176/255.0, blue: 255/255.0, alpha: 1.0)]

        
        let item = UITabBarItem.appearance()
        item.setTitleTextAttributes(attrs, forState: .Normal)
        item.setTitleTextAttributes(selectedAttrs, forState: .Selected)

    }
    
    var _homeCtl = UIViewController()
    var _detailCtl = UIViewController()
    var _profileCtl = UIViewController()
    //全局变量控制刷badgeValue
    var selectedTabBar = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _homeCtl.view.backgroundColor = UIColor.whiteColor()
        _detailCtl.view.backgroundColor = UIColor.whiteColor()
        _profileCtl.view.backgroundColor = UIColor.whiteColor()
        //添加子控制器
        self.setupChildVc(_homeCtl, title: "新建礼单",tabBarItemTitle:"新建礼单本", image: "tabBar_home_icon", selectedImage: "tabBar_home_click_icon")
        self.setupChildVc(_detailCtl, title: "礼单明细", tabBarItemTitle:"礼单明细",image: "tabBar_detail_icon", selectedImage: "tabBar_detail_click_icon")
        
        self.setupChildVc(_profileCtl, title: "我的礼单",tabBarItemTitle:"我的礼单", image: "tabBar_profile_icon", selectedImage: "tabBar_profile_click_icon")
        // Do any additional setup after loading the view.
        
        tabBarH = self.tabBar.height
      
        self.tabBar.backgroundImage = UIImage(named: "图层-45")
        UITabBar.appearance().shadowImage = UIImage(named: "矩形-19")
  
        
        

    }


    func requestUnreadNumber(){
        //1.发送请求badgeValue:[目前假数据]
        
        //2.请求成功--设置相关值
//        _homeCtl.tabBarItem.badgeValue = "10"
//        _detailCtl.tabBarItem.badgeValue = "5"
//        _profileCtl.tabBarItem.badgeValue = "12"
//        UIApplication.sharedApplication().applicationIconBadgeNumber = 27//三个之和
    }
    
    func setupChildVc(vc:UIViewController,title:String,tabBarItemTitle:String,image:String,selectedImage:String)
        {
            // 设置文字和图片
            vc.navigationItem.title = title;
            vc.tabBarItem.title = tabBarItemTitle;
            vc.tabBarItem.image = UIImage(named: image)
            vc.tabBarItem.selectedImage = UIImage(named: selectedImage)
            

            // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
            let nav = CHDNavigationController(rootViewController: vc)
            self.addChildViewController(nav)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
//    private func customedPageController() -> PageController {
//        let vcClasses: [UIViewController.Type] = [SSCDetailController.self]
//        let titles = ["记账"]
//        let pageController = PageController(vcClasses: vcClasses, theirTitles: titles)
//        pageController.pageAnimatable = true
//        pageController.menuViewStyle = MenuViewStyle.Line
//        pageController.bounces = true
//        pageController.menuHeight = 44
//        pageController.titleSizeNormal = 16
//        pageController.titleSizeSelected = 16
////        pageController.values = ["你好"] // pass values
////        pageController.keys = ["text"] // keys
////        pageController.title = "Test"
//        pageController.menuBGColor = .clearColor()
//        pageController.showOnNavigationBar = true
//        pageController.contentView?.frame = CGRectMake(0, 0, DeviceW - 200, 44)
//        // pageController.
//        //        pageController.selectedIndex = 1
//        //        pageController.progressColor = .blackColor()
//        //        pageController.viewFrame = CGRect(x: 50, y: 100, width: 320, height: 500)
//        //        pageController.itemsWidths = [100, 50]
//        //        pageController.itemsMargins = [50, 10, 100]
//        //        pageController.titleSizeNormal = 12
//        //        pageController.titleSizeSelected = 14
//        //        pageController.titleColorNormal = UIColor.brownColor()
//        //        pageController.titleColorSelected = UIColor.blackColor()
//        return pageController
//    }
//    
//    private func reloadPageController(pageController: PageController, afterDelay delay: NSTimeInterval) {
//        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
//        dispatch_after(delayTime, dispatch_get_main_queue()) {
//           // pageController.titles = ["Hello", "World", "Reload"]
//          //  pageController.viewControllerClasses = [ViewController.self, SSCDetailController.self, ViewController.self]
////            pageController.values = ["Hello", "I'm Mark", "Reload"]
////            pageController.keys = ["type", "text", "type"]
//            pageController.reloadData()
//        }
//    }
//    
//    private func updatePageController(pageController: PageController, title: String, afterDelay delay: NSTimeInterval) {
//        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
//        dispatch_after(delayTime, dispatch_get_main_queue()) {
//            pageController.updateTitle(title, atIndex: 1, andWidth: 150)
//        }
//    }
    //MARK:点击tabBar实现刷新badgeValue:
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
       
        if item == _homeCtl.tabBarItem && selectedTabBar == 0 {
            selectedTabBar = 0
//            _homeCtl.refreshBadgeValue()
            _homeCtl.tabBarItem.badgeValue = nil
            
        }
        if item == _detailCtl.tabBarItem && selectedTabBar == 1 {
            selectedTabBar = 1
//            _homeCtl.refreshBadgeValue()
            _detailCtl.tabBarItem.badgeValue = nil
            
        }
        if item == _profileCtl.tabBarItem && selectedTabBar == 2 {
            selectedTabBar = 2
//            _homeCtl.refreshBadgeValue()
            _profileCtl.tabBarItem.badgeValue = nil
        }
        switch item {
        case _homeCtl.tabBarItem:
            selectedTabBar = 0
            break
        case _detailCtl.tabBarItem:
            selectedTabBar = 1
            break
        case _profileCtl.tabBarItem:
            selectedTabBar = 2
            break
        default: break
        }
    }

}
