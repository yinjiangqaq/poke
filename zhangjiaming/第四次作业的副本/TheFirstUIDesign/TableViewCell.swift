//
//  TableViewCell.swift
//  TheFirstUIDesign
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 turtlejermine. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
