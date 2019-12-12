//
//  usersign.swift
//  YourDiary
//
//  Created by Apple on 2019/12/10.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation
import UIKit

class usersign: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userSign, forKey: "signKey")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        userSign = aDecoder.decodeObject(forKey: "signKey") as? String
        
    }
    var userSign: String?
    
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    
    
    
    init( userSign: String?) {
        
        self.userSign = userSign
        
    }
}
