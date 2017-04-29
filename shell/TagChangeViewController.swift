//
//  TagChangeViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/22.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class TagChangeViewController: UIViewController {
    
    @IBOutlet weak var searchInput: UITextField!
    @IBOutlet weak var mainScrollView: UIScrollView!
    var isTagExisted = false
    var tag:String = ""
    
    var scroll_height:CGFloat = 465.0

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
        mainScrollView.contentSize = CGSize(width: self.view.bounds.width, height: scroll_height)
        // 设置代理
        mainScrollView.delegate = self as? UIScrollViewDelegate
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func backToPrevious(){
        self.navigationController?.popViewController(animated: true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func coolTag(_ sender: Any) {
        //传输这个标签回后端或者到首页
        self.navigationController?.popViewController(animated: true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func gentletag(_ sender: Any) {
        //传输这个标签回后端或者到首页
        self.navigationController?.popViewController(animated: true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func sadTag(_ sender: Any) {
        //传输这个标签回后端或者到首页
        self.navigationController?.popViewController(animated: true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func blueTag(_ sender: Any) {
        //传输这个标签回后端或者到首页
        self.navigationController?.popViewController(animated: true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func calmTag(_ sender: Any) {
        //传输这个标签回后端或者到首页
        self.navigationController?.popViewController(animated: true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func freshTag(_ sender: Any) {
        //传输这个标签回后端或者到首页
        self.navigationController?.popViewController(animated: true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func searchTag(_ sender: Any) {
        tag = searchInput.text!
        //后端检查tag是否存在
        if(isTagExisted){
            //传输这个标签回后端或者到首页
            self.navigationController?.popViewController(animated: true)
            UIApplication.shared.statusBarStyle = .default
        }
        else{
            searchInput.text = "该标签不存在，请重新搜索"
        }
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
