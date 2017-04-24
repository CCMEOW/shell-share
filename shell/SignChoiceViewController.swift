//
//  SignChoiceViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/19.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class SignChoiceViewController: UIViewController {

    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var WeChatButton: UIButton!
    @IBOutlet weak var QQButton: UIButton!
    @IBOutlet weak var WeiboButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "transparent"), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

        SignInButton.setBackgroundImage(UIImage(named:"1.0登录"),for:.normal)
        SignUpButton.setBackgroundImage(UIImage(named:"1.0注册"),for:.normal)
        WeChatButton.setBackgroundImage(UIImage(named:"1.0微信"),for:.normal)
        QQButton.setBackgroundImage(UIImage(named:"1.0QQ"),for:.normal)
        WeiboButton.setBackgroundImage(UIImage(named:"1.0微博"),for:.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
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
