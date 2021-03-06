//
//  food.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation
import UIKit
class food: NSObject, NSCoding  {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(foodTitle, forKey: "titleKey")
        aCoder.encode(foodContent, forKey: "contentKey")
        aCoder.encode(foodAvatar, forKey: "avatarKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        foodTitle = aDecoder.decodeObject(forKey: "titleKey") as? String
        foodContent = aDecoder.decodeObject(forKey: "contentKey") as? String
        foodAvatar = aDecoder.decodeObject(forKey: "avatarKey")as? UIImage
        
    }
    

    
    var foodTitle: String?
    var foodContent: String?
    var foodAvatar: UIImage?
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    init(name: String?, description: String?, foodAvatar: UIImage?) {
        self.foodTitle = name
        self.foodContent = description
        self.foodAvatar = foodAvatar
    }
}
