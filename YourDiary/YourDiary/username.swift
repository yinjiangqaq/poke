//
//  user.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation
import UIKit

class username: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userName, forKey: "nameKey")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        userName = aDecoder.decodeObject(forKey: "nameKey") as? String
     
    }
    var userName: String?


    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!




    init( userName: String?) {
        
        self.userName = userName
  
    }
}
