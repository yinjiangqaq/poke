//
//  user.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation

class user: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userName, forKey: "nameKey")
        aCoder.encode(userSex, forKey: "sexKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        userName = aDecoder.decodeObject(forKey: "nameKey") as? String
        userSex = aDecoder.decodeObject(forKey: "sexKey") as? String
    }
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    var userName: String?
    var userSex: String?
    
    init( userName: String?, userSex: String?) {
        
        self.userName = userName
        self.userSex = userSex
    }
}
