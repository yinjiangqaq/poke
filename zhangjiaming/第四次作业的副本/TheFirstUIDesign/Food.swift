//
//  Food.swift
//  TheFirstUIDesign
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 turtlejermine. All rights reserved.
//

import Foundation
import UIKit

class Food: NSObject , NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "nameKey")
        aCoder.encode(foodDescription, forKey: "descriptionKey" )
        aCoder.encode(foodAvatar, forKey: "avatarKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        foodDescription = aDecoder.decodeObject(forKey: "descriptionKey") as? String
        foodAvatar = aDecoder.decodeObject(forKey: "avatarKey") as? UIImage
    }
    
    var name : String?
    var foodDescription : String?
    var foodAvatar : UIImage?
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    init(name:String?,foodDescription:String?,foodAvatar: UIImage?) {
        self.name=name
        self.foodDescription=foodDescription
        self.foodAvatar=foodAvatar
    }
    
}
