//
//  MyTabBarController.swift
//  shell
//
//  Created by Shelro on 2017/4/22.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addCenterButton(btnimage: UIImage(named: "center")!, selectedbtnimg: UIImage(named: "center")!, selector: "addOrderView", view: self.view)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.tabBar.tintColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCenterButton(btnimage buttonImage:UIImage,selectedbtnimg selectedimg:UIImage,selector:String,view:UIView){
        //创建一个自定义按钮
        let button:UIButton = UIButton(type: UIButtonType.custom)
        //btn.autoresizingMask
        //button大小为适应图片
        button.frame = CGRect(x: 0, y: 0, width: buttonImage.size.width, height: buttonImage.size.height)
        button.setImage(buttonImage, for: UIControlState.normal)
        button.setImage(selectedimg, for: UIControlState.selected)
        //去掉阴影
        button.adjustsImageWhenDisabled = true;
        //按钮的代理方法
        button.addTarget( self, action: Selector(selector), for:UIControlEvents.touchUpInside )
        //高度差
        let heightDifference:CGFloat = buttonImage.size.height - self.tabBar.frame.size.height
        if (heightDifference < 0){
            button.center = self.tabBar.center;
        }
        else
        {
            var center:CGPoint = self.tabBar.center;
            center.y = center.y - heightDifference/2.0;
            button.center = center;
        }
        view.addSubview(button);
    }
    
    
    //按钮方法
    func addOrderView(){
        print("执行")
        let myStoryBoard = self.storyboard
        var anotherView = UIViewController()
        anotherView = (myStoryBoard?.instantiateViewController(withIdentifier: "sendConch"))!
        self.present(anotherView, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
