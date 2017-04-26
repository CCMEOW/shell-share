//
//  NotificationTableViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/26.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    
    //目前展示的数据，后期须替换为传入的通知数据
    let notificationItem = [
        NotificationData(title: "海螺第一届故事大会开始啦！"),
        NotificationData(title: "系统将于本周四晚凌晨4点更新。")
    ]
    var notiSet = [NotificationData]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: NotifictionCell)
        tableView.rowHeight = 70
        
        //var noti: NotificationData
        for noti in notificationItem{
            notiSet.append(noti)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notiSet.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifictionCell", for: indexPath) as! NotifictionTableViewCell
        // Table view cells are reused and should be dequeued using a cell identifier.
        //let cellIdentifier = "NotifictionCell"
        
        /*
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NotificationTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }*/
        
        // Fetches the appropriate meal for the data source layout.
        let notiItem = notiSet[indexPath.row]
        
        cell.title.text = notiItem.title
        cell.sendDate.text = notiItem.sendDate

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
