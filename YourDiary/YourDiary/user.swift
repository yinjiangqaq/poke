//
//  user.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation
import UIKit
class user: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userName, forKey: "nameKey")
        aCoder.encode(userSex, forKey: "sexKey")
        aCoder.encode(userEmail,forKey: "emailKey")
        aCoder.encode(userPassword,forKey: "passwordKey")
        aCoder.encode(portrait,forKey: "portraitKey")
        aCoder.encode(userInfo,forKey: "userInfoKey")
        aCoder.encode(userAge,forKey: "userAgeKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        userName = aDecoder.decodeObject(forKey: "nameKey") as? String
        userSex = aDecoder.decodeObject(forKey: "sexKey") as? String
        userEmail = aDecoder.decodeObject(forKey: "emailKey")as? String
        userPassword = aDecoder.decodeObject(forKey: "passwordKey")as? String
        portrait = aDecoder.decodeObject(forKey: "portraitKey")as? UIImage
        userInfo = aDecoder.decodeObject(forKey: "userInfoKey")as? String
        userAge = aDecoder.decodeObject(forKey: "userAgeKey")as? Int
    }
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("userList")
    var userName: String?
    var userSex: String?
    var userEmail: String?
    var userPassword: String?
    var portrait: UIImage?
    var userInfo: String?
    var userAge: Int?
    
    init( userName: String?, userSex: String? , userEmail: String?,
     userPassword: String?,portrait: UIImage?,userInfo: String?,
   userAge: Int?) {
        
        self.userName = userName
        self.userSex = userSex
        self.userEmail = userEmail
        self.userInfo = userInfo
        self.userPassword = userPassword
        self.userAge = userAge
        self.portrait = portrait
    }
}
