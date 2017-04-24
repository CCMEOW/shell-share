//
//  TagChangeViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/22.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class TagChangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        
        let leftBarBtn = UIBarButtonItem(title: "title", style: .plain, target: self, action: #selector(TagChangeViewController.backToPrevious))
        leftBarBtn.image = UIImage(named: "back2")
        leftBarBtn.tintColor = UIColor.white
        leftBarBtn.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0)
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = -5;
        
        self.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
        
        UIApplication.shared.statusBarStyle = .lightContent
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func backToPrevious(){
        self.navigationController?.popViewController(animated: true)
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
