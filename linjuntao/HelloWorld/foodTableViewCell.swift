//
//  foodTableViewCell.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class foodTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var contentText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
