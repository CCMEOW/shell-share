//
//  SearchSongViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/28.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class SearchSongViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //原始数据；后端JSON传入
    let songData = ["A Cup of Coffee", "Summer Vibe", "Coffee Kiss", "I do Adore", "Zou Bisou, Bisou", "Ash Cloud", "Cut Dick", "Rock n'roll", "Lullaby","Successlessness","You Ain't the first","Waiting on the World to Change"]
    let songSinger = ["Julian Moon", "Walk off the Earth", "Shane Alexander", "Mindy Glendhill", "Jessica Pera", "Brazzaville", "Mr.Oizo", "The Sounds", "Morrie","The Lucksmiths","Gun N'Rose","John Mayer"]
    
    var result1 = [String]()
    var result2 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 搜索内容为空时，显示全部内容
        self.result1 = self.songData
        self.result2 = self.songSinger
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.searchBar.placeholder = "搜索"
        
        
        // 注册tableviewCell
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        UIApplication.shared.statusBarStyle = .default
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify: String = "cell"
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identify)
        
        cell.accessoryType = UITableViewCellAccessoryType.init(rawValue: 1)!
        cell.textLabel?.text = self.result1[indexPath.row]
        cell.detailTextLabel?.text = self.result2[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myStoryBoard = self.storyboard
        var anotherView = UIViewController()
        anotherView = (myStoryBoard?.instantiateViewController(withIdentifier: "songDetail"))!
        navigationController?.pushViewController(anotherView, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("[ViewController searchBar] searchText: \(searchText)")
        
        // 没有搜索内容时显示全部内容
        if searchText == "" {
            self.result1 = self.songData
            self.result2 = self.songSinger
        } else {
            
            // 匹配用户输入的前缀，不区分大小写
            self.result1 = []
            self.result2 = []
            var i = 0
            
            for arr in self.songData {
                if arr.lowercased().hasPrefix(searchText.lowercased()) {
                    self.result1.append(arr)
                    self.result2.append(songSinger[i])
                }
                i = i+1
            }
        }
        
        // 刷新tableView 数据显示
        self.tableView.reloadData()
    }
    
    // 搜索触发事件，点击虚拟键盘上的search按钮时触发此方法
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
    
    // 书签按钮触发事件
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        
        print("搜索历史")
    }
    
    // 取消按钮触发事件
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // 搜索内容置空
        searchBar.text = ""
        self.result1 = self.songData
        self.result2 = self.songSinger
        self.tableView.reloadData()
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
