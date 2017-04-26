//
//  TableViewController.swift
//  PageController
//
//  Created by Mark on 15/10/31.
//  Copyright © 2015年 Wecan Studio. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var text = ""
    fileprivate let cellReuseIdentifier = "cellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.rowHeight = 60
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        //cell.imageView?.image = UIImage(named: "github")
        cell.textLabel?.text = text
        
        return cell
    }
    
    
}
