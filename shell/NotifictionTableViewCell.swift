//
//  NotifictionTableViewCell.swift
//  shell
//
//  Created by Shelro on 2017/4/26.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class NotifictionTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var sendDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
