//
//  InformationViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/30.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    //原始数据；后端JSON传入
    let information = ["您的海螺获得了56次喜欢！","第一届海螺故事大赛开始啦！", "系统将于下周四更新。"]
    
    var result1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.result1 = self.information
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // 注册tableviewCell
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        UIApplication.shared.statusBarStyle = .default
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify: String = "cell"
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identify)
        
        cell.accessoryType = UITableViewCellAccessoryType.none
        cell.textLabel?.text = self.result1[indexPath.row]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
