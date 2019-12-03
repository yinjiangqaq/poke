//
//  calendarViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class calendarViewController: UIViewController ,FSCalendarDataSource,FSCalendarDelegate{
    
    //    fileprivate lazy var calendar : FSCalendar={
    //        let calendar=FSCalendar.init(frame: CGRect.init(x:0,y:0,width: UIScreen.main.bounds.width,height: 300))
    //        calendar.dataSource=self
    //        calendar.delegate=self
    //        return calendar
    //    }()
    
    @IBOutlet weak var calendar: FSCalendar!
    
    var noteList: [Note] = [Note]()
    
    func initNoteList() {
        var tempNoteList : [Note]? = loadNoteFile()
        if(tempNoteList==nil){
            noteList.append(Note(year: 2019, month: 12, day: 3, weekday: "星期二", noteContent: "测试内容", noteImages: nil, mood: nil, weather: nil))
            noteList.append(Note(year: 2019, month: 12, day: 4, weekday: "星期三", noteContent: "测试内容", noteImages: nil, mood: nil, weather: nil))
            noteList.append(Note(year: 2019, month: 12, day: 5, weekday: "星期四", noteContent: "测试内容", noteImages: nil, mood: nil, weather: nil))
        }else{
            noteList = tempNoteList!
        }
    }
    
    func saveNoteFile(){
        let success = NSKeyedArchiver.archiveRootObject(noteList, toFile: Note.ArchiveURL.path)
        if !success{
            print("Failed..........")
        }
    }
    
    func loadNoteFile() -> [Note]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Note.ArchiveURL.path) as? [Note])
    }
    
    var calendars:Calendar = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNoteList()
        
        //        self.view.addSubview(calendar)
        
        // Do any additional setup after loading the view.
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("didSelet\(date)")
        var year = calendars.component(.year , from: date)
        var month = calendars.component(.month , from: date)
        var day = calendars.component(.day , from: date)
        print("year is \(year),month is \(month),day is \(day)")
        
        noteList.forEach{ (n) in
            if (n.year!==year){
                if(n.month!==month){
                    if(n.day!==day){
                        print(n.weekday!)
                    }
                    //                    else{
                    //                        print("n.day is \(n.day),day is \(day)")
                    //                    }
                }
                //                else{
                //                    print("n.month is \(n.month),month is \(month)")
                //                }
                
            }
            //            else{
            //                print("n.year is \(n.year),year is \(year)")
            //            }
        }
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
