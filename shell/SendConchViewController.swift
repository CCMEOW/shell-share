//
//  SendConchViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/23.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class SendConchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let leftBarBtn = UIBarButtonItem(title: "title", style: .plain, target: self, action: #selector(SendConchViewController.backToPrevious))
        leftBarBtn.image = UIImage(named: "back")
        leftBarBtn.tintColor = UIColor.black
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = -5;
        
        self.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backToPrevious(){
        self.dismiss(animated: true, completion:nil)
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
