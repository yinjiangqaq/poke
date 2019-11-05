//
//  food.swift
//  project1
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Younger. All rights reserved.
/**/
//
import Foundation
import UIKit

class food: NSObject,NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name,forKey:"nameKey")
        aCoder.encode(fooddescription,forKey:"descriptionKey")
        aCoder.encode(foodAvatar,forKey: "AvaterKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey:"nameKey") as? String
        fooddescription = aDecoder.decodeObject(forKey:"descriptionKey") as? String
        foodAvatar = aDecoder.decodeObject(forKey:"AvaterKey") as? UIImage
    }
    
    var name: String?
    var fooddescription: String?
    var foodAvatar:UIImage?
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    
    
    init(name: String?, description: String?,foodAvatar:UIImage?){
        self.name = name
        self.fooddescription = description
        self.foodAvatar = foodAvatar
    }
}
