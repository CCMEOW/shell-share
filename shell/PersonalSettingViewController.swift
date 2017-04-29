//
//  PersonalSettingViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/29.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class PersonalSettingViewController: UIViewController {
    
    var user_name:String = ""
    var password:String = ""
    var new_password:String = ""
    var isPasswordCorrect = true
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!

    @IBAction func setHeadPortary(_ sender: Any) {
    }
    
    @IBAction func backToPre(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func saveSetting(_ sender: Any) {
        //把新设置的信息传输到后端
        user_name = userName.text!
        password = oldPassword.text!
        new_password = newPassword.text!
        if(isPasswordCorrect){
            self.dismiss(animated: true, completion:nil)
        }
        else{
            let alterController = UIAlertController(title: "提示", message: "原密码输入错误，请重试", preferredStyle:.alert)
            let confirmAction = UIAlertAction(title: "确认", style: .default, handler: nil)
            alterController.addAction(confirmAction)
            self.present(alterController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
