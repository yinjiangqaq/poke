//
//  food.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation

class food  {

    var foodTitle: String?
    var foodContent: String?
    
    init(name: String?, description: String?) {
        self.foodTitle = name
        self.foodContent = description
    }
}
