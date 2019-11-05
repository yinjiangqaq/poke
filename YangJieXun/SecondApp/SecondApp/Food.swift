//
//  Food.swift
//  SecondApp
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Nic. All rights reserved.
//

import Foundation
import UIKit

class Food: NSObject, NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(foodName, forKey:"nameKey")
        aCoder.encode(foodDescription, forKey:"descriptionKey")
        aCoder.encode(foodAvatar, forKey:"avatarKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        foodName = aDecoder.decodeObject(forKey:"nameKey") as? String
        foodDescription = aDecoder.decodeObject(forKey:"descriptionKey") as? String
        foodAvatar = aDecoder.decodeObject(forKey:"avatarKey") as? UIImage
    }
    
    var foodName: String?
    var foodDescription: String?
    var foodAvatar: UIImage?
    
    //发现项目的根目录
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    //创建子目录
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    init(name: String?, description: String?, foodAvatar: UIImage?){
        self.foodName = name
        self.foodDescription = description
        self.foodAvatar = foodAvatar
    }
}
