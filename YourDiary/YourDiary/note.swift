//
//  Note.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//
import Foundation
import UIKit
class Note: NSObject, NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(year, forKey: "yearKey")
        aCoder.encode(month, forKey: "monthKey")
        aCoder.encode(day, forKey: "dayKey")
        aCoder.encode(weekday, forKey: "weekdayKey")
        aCoder.encode(noteContent, forKey: "contentKey")
        aCoder.encode(noteImages, forKey: "imagesKey")
        aCoder.encode(mood, forKey: "moodKey")
        aCoder.encode(weather, forKey: "weatherKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        year = aDecoder.decodeObject(forKey: "yearKey") as? Int
        month = aDecoder.decodeObject(forKey: "monthKey") as? Int
        day = aDecoder.decodeObject(forKey: "dayKey") as? Int
        weekday = aDecoder.decodeObject(forKey: "weekdayKey") as? String
        noteContent = aDecoder.decodeObject(forKey: "contentKey") as? String
        noteImages = aDecoder.decodeObject(forKey: "imagesKey") as? [UIImage]
        mood = aDecoder.decodeObject(forKey: "moodKey") as? UIImage
        weather = aDecoder.decodeObject(forKey: "weatherKey") as? UIImage
        
    }
    
    var year: Int!
    var month: Int!
    var day: Int!
    var weekday: String!
    var noteContent: String!
    var noteImages: [UIImage]?
    var mood: UIImage?
    var weather: UIImage?
    
    //发现项目的根目录
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    //在项目的根目录下创建子目录
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("noteList")
    
    init(year: Int?, month: Int?, day: Int?, weekday: String?,  noteContent: String?, noteImages: [UIImage]?, mood: UIImage?, weather: UIImage?) {
        self.year = year
        self.month = month
        self.day = day
        self.weekday = weekday
        self.noteContent = noteContent
        self.noteImages = noteImages
        self.mood = mood
        self.weather = weather
    }
}
