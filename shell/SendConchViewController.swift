//
//  SendConchViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/23.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class SendConchViewController: UIViewController {
    
    @IBOutlet weak var anonymous: UIButton!
    @IBOutlet weak var SongName: UITextField!
    @IBOutlet weak var SingerNam: UITextField!
    @IBOutlet weak var SongURL: UITextField!
    @IBOutlet weak var ConchContent: UITextView!
    @IBOutlet weak var ConchTag: UITextField!
    @IBOutlet weak var weibo: UIButton!
    @IBOutlet weak var wechat: UIButton!
    @IBOutlet weak var QQ: UIButton!
    @IBOutlet weak var sendConchButton: UIButton!
    
    var name : String = ""
    var singer : String = ""
    var url : String = ""
    var content: String = ""
    var tag: String = ""
    
    @IBAction func anonymousOrNot(_ sender: Any) {
        if(anonymous.tag == 0){
            anonymous.setTitle("非匿名", for: .normal)
            anonymous.setTitleColor(UIColor.black, for: .normal)
            anonymous.tag = 1;
        }
        else{
            anonymous.setTitle("匿名", for: .normal)
            anonymous.setTitleColor(UIColor.black, for: .normal)
            anonymous.tag = 0;
        }
    }
    
    @IBAction func finshSendConch(_ sender: Any) {
        //这里是暂时写的get数据的，目前都按照wiki写的，没有封装成JSON
        name = SongName.text!
        singer = SingerNam.text!
        url = SongURL.text!
        content = ConchContent.text!
        tag = ConchTag.text!
        
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func searchSongUrl(_ sender: Any) {
        name = SongName.text!
        singer = SingerNam.text!
        //到数据库中搜索有没有相关的链接,并返回明明给url这个变量
        if(url == ""){
            SongURL.text = "  找不到这首歌，请填写链接"
        }
    }
    
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
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        anonymous.setTitle("匿名", for: .normal)
        anonymous.setTitleColor(UIColor.black, for: .normal)
        anonymous.tag = 0;
        
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
