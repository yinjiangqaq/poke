//
//  foodcellTableViewCell.swift
//  project1
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 Younger. All rights reserved.
//

import UIKit



class foodcellTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var foodname: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
