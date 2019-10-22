//
//  food.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation

class food: NSObject, NSCoding  {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(foodTitle, forKey: "titleKey")
        aCoder.encode(foodContent, forKey: "contentKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        foodTitle = aDecoder.decodeObject(forKey: "titleKey") as? String
        foodContent = aDecoder.decodeObject(forKey: "contentKey") as? String
        
    }
    

    
    var foodTitle: String?
    var foodContent: String?
    
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    init(name: String?, description: String?) {
        self.foodTitle = name
        self.foodContent = description
    }
}
