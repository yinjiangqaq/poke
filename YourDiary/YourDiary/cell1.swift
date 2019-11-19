//
//  cell1.swift
//  YourDiary
//
//  Created by Apple on 2019/11/19.
//  Copyright © 2019 feng. All rights reserved.
//


import Foundation
import UIKit

class cell1: NSObject,NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name,forKey:"nameKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey:"nameKey") as? String
    }
    
    var name: String?

    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("List1")
    
    
    
    init(name: String?){
        self.name = name    }
}
