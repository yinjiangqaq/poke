//
//  calendarViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class calendarViewController: UIViewController ,FSCalendarDataSource,FSCalendarDelegate,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet var topView: UIView!
    @IBOutlet weak var noteListTableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    
    var calendars:Calendar = Calendar.current
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNoteList()
        self.noteListTableView.backgroundColor=UIColor.clear
        topView.backgroundColor = UIColor.init(patternImage: UIImage(named: "starrySky")!)
        
        self.noteListTableView.register(UINib(nibName: "NoteListTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteListTableViewCell")
        
        
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
                }
                
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NoteListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NoteListTableViewCell",for: indexPath) as! NoteListTableViewCell
        
        cell.day.text=String(noteList[indexPath.row].day)
        cell.month.text=String(noteList[indexPath.row].month)+"月"
        cell.weekday.text=noteList[indexPath.row].weekday
        cell.weatherImage.image=noteList[indexPath.row].weather
        cell.feelingImage.image=noteList[indexPath.row].mood
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//        }
//    }
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
    
    
}
