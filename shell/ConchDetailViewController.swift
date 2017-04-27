//
//  ConchDetailViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/27.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class ConchDetailViewController: UIViewController {
    
    var songName: UILabel!
    var singerName: UILabel!
    
    //传输进来的数据
    var like = 20;
    var collection = 32;
    var content = " \"    年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频……\""
    var song_name = "Mathilde’s First Waltz"
    var singer_name = "Bark Cat Bark"
    var user_name = "Fiction飞鸟"
    //var user_icon

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let leftBarBtn = UIBarButtonItem(title: "title", style: .plain, target: self, action: #selector(ConchDetailViewController.backToPrevious))
        leftBarBtn.image = UIImage(named: "back2")
        leftBarBtn.tintColor = UIColor.white
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = -5;
        
        self.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
        
        let rightBarBtn = UIBarButtonItem(title: "title", style: .plain, target: self, action: #selector(ConchDetailViewController.comeToShare))
        rightBarBtn.image = UIImage(named: "share")
        rightBarBtn.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItems = [rightBarBtn]
        
        songName = UILabel(frame: CGRect(x: 30, y: 50, width: self.view.frame.width - 60, height: 50))
        singerName = UILabel(frame: CGRect(x: 30, y: 150, width: self.view.frame.width - 60, height: 50))
        
        songName.text = song_name
        singerName.text = singer_name
        
        self.navigationItem.titleView?.addSubview(songName)
        //self.navigationItem.titleView?.addSubview(singerName)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backToPrevious(){
        self.dismiss(animated: true, completion:nil)
    }
    func comeToShare(){
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
