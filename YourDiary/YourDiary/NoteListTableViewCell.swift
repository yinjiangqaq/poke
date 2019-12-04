//
//  NoteListTableViewCell.swift
//  YourDiary
//
//  Created by TurtleJermine on 2019/12/3.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class NoteListTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var weekday: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var feelingImage: UIImageView!
    @IBOutlet weak var noteContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor=UIColor.clear
        cellView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 10
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
