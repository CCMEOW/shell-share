//
//  ConchDetailViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/27.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class ConchDetailViewController: UIViewController {
    
    @IBOutlet weak var singerName: UILabel!
    @IBOutlet weak var contentField: UITextView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var collectButton: UIButton!
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var likeNum: UILabel!
    @IBOutlet weak var collectNum: UILabel!
    var isLiked = false;
    var isCollected = false;
    var isReported = false
    var reportRea :String = ""
    
    var originY:CGFloat = 10.0
    
    //传输进来的数据
    var like = 20;
    var collection = 32;
    var content = "    年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。\n   年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。\n      年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。\n      年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。\n      年轻的教父干掉第一桶金之后从天台下来，若无其事地哄着襁褓中的迈克；暮年的教父跟孙子玩耍，倒在花园里，孙子却安之若素；脑海里闪过，穿着军服的年轻迈克跟女友在舞池游弋，华尔兹与时光同频。"
    var song_name = "Mathilde’s First Waltz"
    var singer_name = "Bark Cat Bark"
    var user_name = "Fiction飞鸟"
    //var user_icon
    var reportNews: UITextField?
    
    var content_height = 0

    @IBAction func toSongURL(_ sender: Any) {
        //点击跳转到歌曲的网页链接界面
        //目前先把这个动作写成关闭界面
        self.dismiss(animated: true, completion:nil)
    }
    
    
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
    
    @IBAction func reportBadConch(_ sender: Any) {
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
        
        self.navigationItem.title = song_name
        let dict:NSDictionary = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
        
        singerName.text = singer_name
        userName.text = user_name
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        //设置textView
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 4
        let attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 14),NSParagraphStyleAttributeName: paraph]
        contentField.attributedText = NSAttributedString(string: content, attributes: attributes)
        content_height = Int(heightForTextView(textView: contentField, fixedWidth: 307))
        let frame: CGRect = contentField.frame
        //var constraintSize:CGSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        contentField.isScrollEnabled = false
        contentField.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: CGFloat(content_height));

        likeButton.frame = CGRect(x: 40, y: (270+content_height+10), width:30, height:30 )
        likeNum.frame = CGRect(x: 80, y: (270+content_height+15), width:42, height:21 )
        collectButton.frame = CGRect(x: 120, y: (270+content_height+10), width:30, height:30 )
        collectNum.frame = CGRect(x: 160, y: (270+content_height+15), width:42, height:21 )
        reportButton.frame = CGRect(x: 270, y: (270+content_height+10), width:30, height:30 )
        
        //设置scrollView
        mainScrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        // 其他属性
        mainScrollView.isScrollEnabled = true // 可以上下滚动
        mainScrollView.scrollsToTop = true // 点击状态栏时，可以滚动回顶端
        mainScrollView.bounces = true // 反弹效果，即在最顶端或最底端时，仍然可以滚动，且释放后有动画返回效果
        mainScrollView.isPagingEnabled = false // 分页显示效果
        mainScrollView.showsHorizontalScrollIndicator = false // 显示水平滚动条
        mainScrollView.showsVerticalScrollIndicator = true // 显示垂直滚动条
        mainScrollView.indicatorStyle = UIScrollViewIndicatorStyle.white // 滑动条的样式
        // 设置内容大小
        originY = CGFloat(270 + content_height + 50)
        mainScrollView.contentSize = CGSize(width: self.view.bounds.width, height: originY)
        // 设置代理
        mainScrollView.delegate = self as? UIScrollViewDelegate
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
    
    func heightForTextView(textView: UITextView, fixedWidth: CGFloat) -> CGFloat {
        let size = CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)
        let constraint = textView.sizeThatFits(size)
        return constraint.height
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
