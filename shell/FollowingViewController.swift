//
//  FollowingViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/29.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class FollowingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    //原始数据；后端JSON传入
    let following_name = ["Fiction飞鸟", "Shelro", "Orient", "CCMEOW", "Iris", "Lostezra", "Yopepe", "Melody", "DQJ","辟玉禅师","甘旧","林四月"]
  
    var result1 = [String]()
    
    @IBAction func backToPre(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.result1 = self.following_name
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
        
        cell.accessoryType = UITableViewCellAccessoryType.init(rawValue: 1)!
        cell.textLabel?.text = self.result1[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myStoryBoard = self.storyboard
        var anotherView = UIViewController()
        anotherView = (myStoryBoard?.instantiateViewController(withIdentifier: "someOneSpace"))!
        navigationController?.pushViewController(anotherView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}