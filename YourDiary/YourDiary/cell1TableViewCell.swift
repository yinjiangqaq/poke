//
//  cell1TableViewCell.swift
//  YourDiary
//
//  Created by Apple on 2019/11/19.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class cell1TableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nickname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
