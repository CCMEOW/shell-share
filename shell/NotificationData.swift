//
//  NotificationData.swift
//  shell
//
//  Created by Shelro on 2017/4/26.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class NotificationData: NSObject {
    var title: String = ""
    var sendDate: String = ""
    
    init(title: String){
        self.title = title
        
        let now = NSDate()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        self.sendDate = dformatter.string(from: now as Date)
    }
}
