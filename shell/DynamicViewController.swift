//
//  DynamicViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/25.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class DynamicViewController: PageController, UITableViewDelegate {
    
    var type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createLabel()
        
        var vc = UIViewController.init()
        vc = customedPageController()
        vc.title = "动态"
        vc.navigationItem.hidesBackButton = true;
        //vc.navigationController?.setNavigationBarHidden(true, animated: true)

        self.navigationController?.pushViewController(vc, animated: true)
        
        //self.present(vc, animated: true, completion: nil)
    }
    
    fileprivate func createLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: view.bounds.size.width, height: 100))
        label.text = type
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        view.addSubview(label)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - An example of `PageController`
    fileprivate func customedPageController() -> PageController {
        let vcClasses: [UIViewController.Type] = [FollowViewController.self, MessageTableViewController.self]
        let titles = ["关注", "通知"]
        let pageController = PageController(vcClasses: vcClasses, theirTitles: titles)
        pageController.pageAnimatable = true
        pageController.menuViewStyle = MenuViewStyle.line
        pageController.bounces = true
        pageController.menuHeight = 44
        pageController.titleSizeSelected = 15
        pageController.values = ["", "海螺第一届故事大会开始啦！"] // pass values
        pageController.keys = ["type", "text"] // keys
        pageController.title = "Test"
        pageController.menuBGColor = .clear
        //        pageController.selectedIndex = 1
        //        pageController.progressColor = .blackColor()
        //        pageController.viewFrame = CGRect(x: 50, y: 100, width: 320, height: 500)
        //        pageController.itemsWidths = [100, 50]
        //        pageController.itemsMargins = [50, 10, 100]
        //        pageController.titleSizeNormal = 12
        //        pageController.titleSizeSelected = 14
        //        pageController.titleColorNormal = UIColor.brownColor()
        pageController.titleColorSelected = UIColor(red: 20/255, green: 68/255, blue: 94/255, alpha: 1)
        return pageController
    }

    
}
