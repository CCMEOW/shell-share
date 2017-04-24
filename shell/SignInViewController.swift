//
//  SignInViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/19.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var HeadPortait: UIImageView!
    @IBOutlet weak var EmailInput: UITextField!
    @IBOutlet weak var PasswordInput: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    //var emailValue: String = ""
    //var passwdValue: String = ""
    
    var jsonSignin:JSON=["email":"","passwd":""]
    
    @IBAction func Login(_ sender: Any) {
        let alterController = UIAlertController(title: "提示", message: "信息不可为空", preferredStyle:.alert)
        let confirmAction = UIAlertAction(title: "确认", style: .default, handler: nil)
        
        alterController.addAction(confirmAction)
        
        if((EmailInput.text?.isEmpty)!||(PasswordInput.text?.isEmpty)!||(EmailInput.text=="邮箱")||(PasswordInput.text=="密码")){
            self.present(alterController, animated: true, completion: nil)
        }
        else{
            jsonSignin["email"].string = EmailInput.text!
            jsonSignin["passwd"].string = PasswordInput.text!
            //print(jsonData["emailV"].string)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        EmailInput.delegate = self as? UITextFieldDelegate
        PasswordInput.delegate = self as? UITextFieldDelegate*/
        
        let leftBarBtn = UIBarButtonItem(title: "title", style: .plain, target: self, action: #selector(SignInViewController.backToPrevious))
        leftBarBtn.image = UIImage(named: "back")
        leftBarBtn.tintColor = UIColor.black
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = -5;
 
        self.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
        
        
        EmailInput.layer.borderWidth = 0
        PasswordInput.layer.borderWidth = 0
        
        
        LoginButton.setBackgroundImage(UIImage(named:"1.1登录按钮"),for:.normal)
    }
    
    /*
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        EmailInput.resignFirstResponder()
        PasswordInput.resignFirstResponder()
        return true
    }*/
    

    func backToPrevious(){
        self.navigationController?.popViewController(animated: true)
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
