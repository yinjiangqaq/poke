//
//  note.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation
import UIKit
class note: NSObject, NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(noteImage, forKey: "imageKey")
        aCoder.encode(noteTitle, forKey: "titleKey")
        aCoder.encode(noteContent, forKey: "contentKey")
        aCoder.encode(time, forKey: "timeKey")
        aCoder.encode(weather, forKey: "weatherKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        noteImage = aDecoder.decodeObject(forKey: "imageKey") as? UIImage
        noteTitle = aDecoder.decodeObject(forKey: "titleKey") as? String
        noteContent = aDecoder.decodeObject(forKey: "contentKey") as? String
        
        time = aDecoder.decodeObject(forKey: "timeKey") as? String
        weather = aDecoder.decodeObject(forKey: "weatherKey") as? UIImage
    }
    var noteImage: UIImage?
    var noteTitle: String?
    var noteContent: String?
    var time: String?
    var weather: UIImage?
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
//    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    init(noteImage: UIImage?, noteTitle: String?, noteContent: String?, time: String?, weather: UIImage) {
        self.noteImage = noteImage
        self.noteTitle = noteTitle
        self.noteContent = noteContent
        self.time = time
        self.weather = weather
    }
}
