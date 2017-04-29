//
//  HomePageViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/20.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var collectButton: UIButton!
    @IBOutlet weak var likeNum: UILabel!
    @IBOutlet weak var collectNum: UILabel!
    var isLiked = false;
    var isCollected = false;
    
    @IBOutlet weak var cotentField: UITextView!
    @IBOutlet weak var usrImage: UIImageView!
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var SongName: UILabel!
    @IBOutlet weak var Singer: UILabel!
    
    
    //传输进来的数据
    var like = 20;
    var collection = 32;
    var content = "      年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。"
    var song_name = "Mathilde’s First Waltz"
    var singer_name = "Bark Cat Bark"
    var user_name = "Fiction飞鸟"
    var songL = "《"
    var songR = "》"
    var byer = "——"
    //var user_icon
    var reportNews: UITextField?
    var reportRea :String = "" //传到后端的举报理由
    var isReported = false  //判断是否被举报
    
    
    
    @IBAction func addLike(_ sender: Any) {
        if(!isLiked){
            likeButton.setBackgroundImage(UIImage(named: "like"), for: .normal)
            var s = ""
            var n = 0;
            s = likeNum.text!
            n = Int(s)!;
            n = n+1;
            like = n;
            likeNum.text = String(n)
            isLiked = true;
        }
        else{
            likeButton.setBackgroundImage(UIImage(named: "like2"), for: .normal)
            var s = ""
            var n = 0;
            s = likeNum.text!
            n = Int(s)!;
            n = n-1
            like = n
            likeNum.text = String(n)
            isLiked = false;
        }
    }
    
    @IBAction func addCollection(_ sender: Any) {
        if(!isCollected){
            collectButton.setBackgroundImage(UIImage(named: "collect"), for: .normal)
            var s = ""
            var n = 0;
            s = collectNum.text!
            n = Int(s)!
            n = n+1
            collection = n
            collectNum.text = String(n)
            isCollected = true;
        }
        else{
            collectButton.setBackgroundImage(UIImage(named: "collect2"), for: .normal)
            var s = ""
            var n = 0;
            s = collectNum.text!
            n = Int(s)!
            n = n-1
            collection = n
            collectNum.text = String(n)
            isCollected = false;
        }
    }
    
    @IBAction func loadAnotherConch(_ sender: Any) {
        //从后端传过来的另一个海螺的数据
        like = 11;
        collection = 40;
        content = "     一听到这歌我就想到 泰国第二大城市清迈里的拜县 很美很小清新的一个地方 说走就走的旅行 当时我一个人拉着行李箱自由行来到了这里 第一眼：美呆了。远离城市的喧嚣 安静的就像世外桃源。从食物到建筑到风景都别具一格。真的好想再去一次。。怀念怀念。"
        song_name = "In a tree"
        singer_name = "Priscilla Anh"
        user_name = "Yopepe"
        
        //更新数据
        likeNum.text = String(like)
        collectNum.text = String(collection)
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 4
        let attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 14),NSParagraphStyleAttributeName: paraph]
        cotentField.attributedText = NSAttributedString(string: content, attributes: attributes)
        userName.setTitle(user_name, for: .normal)
        userName.setTitleColor(UIColor.white, for: .normal)
        userName.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        songL = songL + song_name + songR
        SongName.text = songL
        byer = byer + singer_name
        Singer.text = byer
        songL = "《"
        byer = "——"
    }
    
    @IBAction func reportBandConch(_ sender: Any) {
        let alterController = UIAlertController(title: "举报此海螺！", message: "", preferredStyle:.alert)
        let confirmAction = UIAlertAction(title: "确认", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alterController.addAction(confirmAction)
        alterController.addAction(cancelAction)
        alterController.addTextField {
            (reportReason) -> Void in
            self.reportNews = reportReason
            self.reportNews!.placeholder = "<请输入你的举报理由>"
            self.isReported = true
            self.reportRea = (self.reportNews?.text)!
        }
        self.present(alterController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //初始化数值
        likeNum.text = String(like)
        collectNum.text = String(collection)
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 4
        let attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 14),NSParagraphStyleAttributeName: paraph]
        cotentField.attributedText = NSAttributedString(string: content, attributes: attributes)
        cotentField.textContainer.maximumNumberOfLines = 7
        self.cotentField.textContainer.lineBreakMode = NSLineBreakMode.byClipping
        userName.setTitle(user_name, for: .normal)
        userName.setTitleColor(UIColor.white, for: .normal)
        userName.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        songL = songL + song_name + songR
        SongName.text = songL
        byer = byer + singer_name
        Singer.text = byer
        songL = "《"
        byer = "——"
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

      UIApplication.shared.statusBarStyle = .default
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
