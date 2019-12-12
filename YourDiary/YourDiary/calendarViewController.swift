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
    
    var noteList: [Note] = [Note]()                     //显示数据
    var tempNoteList : [Note]?                          //总数据
    var selectedDate : Date = Date()                    //所选日期，初始今天
    
    func initNoteList() {
        tempNoteList = loadNoteFile()
        if(tempNoteList==nil){
            print("tempNoteList is nil")
            noteList.append(Note(year: 2019, month: 12, day: 3, weekday: "星期二", noteContent: "测试内容1", noteImages: nil, mood: nil, weather: nil))
            noteList.append(Note(year: 2019, month: 12, day: 4, weekday: "星期三", noteContent: "测试内容2", noteImages: nil, mood: nil, weather: nil))
            noteList.append(Note(year: 2019, month: 12, day: 12, weekday: "星期四", noteContent: "测试内容3", noteImages: nil, mood: nil, weather: nil))
            tempNoteList=noteList
            noteList.removeAll(keepingCapacity: true)
        }
        else{
            print("tempNoteList is not nil")
        }
        
        print("init 函数内，noteList.count is \(noteList.count),tempNoteList.count is \(tempNoteList!.count)")
        
        getNoteListOfThisDate(tempdate: selectedDate)
        
    }
    
    func getNoteListOfThisDate(tempdate : Date) {
        noteList.removeAll(keepingCapacity: true)
        
        var selectedYear = calendars.component(.year , from: tempdate)
        var selectedMonth = calendars.component(.month , from: tempdate)
        var selectedDay = calendars.component(.day , from: tempdate)
        var selectedWeekday = calendars.component(.weekday , from: tempdate)
        
        print("selected day :year is \(selectedYear),month is \(selectedMonth),day is \(selectedDay),weekday is \(selectedWeekday)")
        
        tempNoteList!.forEach{ (n) in
            if (n.year!==selectedYear){
                if(n.month!==selectedMonth){
                    if(n.day!==selectedDay){
                        noteList.append(n)
                    }
                }
                
            }
        }
        
        print("get 函数内，noteList.count is \(noteList.count),tempNoteList.count is \(tempNoteList!.count)")
        
        
        noteListTableView.reloadData()
        
//        return TempNoteList
        
    }
    
    func saveNoteFile(){
        let success = NSKeyedArchiver.archiveRootObject(tempNoteList, toFile: Note.ArchiveURL.path)
        if !success{
            print("Failed..........")
        }
    }
    
    func loadNoteFile() -> [Note]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Note.ArchiveURL.path) as? [Note])
    }
    
    @IBAction func cancelToList (segue:UIStoryboardSegue){
        noteListTableView.reloadData()
    }
    @IBAction func saveToList (segue:UIStoryboardSegue){
        if let addNoteVC = segue.source as? diaryEditViewController{
            if let addNote = addNoteVC.noteForEdit{
                if let selectedIndexPath = noteListTableView.indexPathForSelectedRow{
                    var TN : Note = noteList[(selectedIndexPath as NSIndexPath).row]
                    tempNoteList = tempNoteList!.filter{ $0 != TN }
                    noteList[(selectedIndexPath as NSIndexPath).row] = addNote
                    tempNoteList!.append(addNote)
                    noteListTableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    tempNoteList!.append(addNote)
                    noteList.append(addNote)
                    let newIndexPath = IndexPath(row: noteList.count-1, section: 0)
                    noteListTableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
        print("saveToList中noteList.count:\(noteList.count),tempNoteList.count:\(tempNoteList!.count)")
        saveNoteFile()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNoteList()
        self.noteListTableView.backgroundColor=UIColor.clear
        topView.backgroundColor = UIColor.init(patternImage: UIImage(named: "starrySky")!)
        
        self.noteListTableView.register(UINib(nibName: "NoteListTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteListTableViewCell")
        
        
        // Do any additional setup after loading the view.
    }
    
    //日历点击函数
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = date
        getNoteListOfThisDate(tempdate: selectedDate)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectNote : Note = noteList[indexPath.row]
        self.performSegue(withIdentifier: "showDetial", sender: selectNote)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NoteListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NoteListTableViewCell",for: indexPath) as! NoteListTableViewCell
        
        cell.day.text=String(noteList[indexPath.row].day)
        cell.month.text=String(noteList[indexPath.row].month)+"月"
        cell.weekday.text=noteList[indexPath.row].weekday
        cell.noteContent.text=noteList[indexPath.row].noteContent
        cell.weatherImage.image=noteList[indexPath.row].weather
        cell.feelingImage.image=noteList[indexPath.row].mood
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            var TN : Note = noteList.remove(at: indexPath.row)
            tempNoteList = tempNoteList!.filter{ $0 != TN }
            noteListTableView.deleteRows(at: [indexPath], with: .fade)
            saveNoteFile()
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        
        let destinationVC = segue.destination as! diaryEditViewController
        if segue.identifier == "showDetial"{
            print("点击cell跳转")
            if let selectedNote = sender as? Note{
                destinationVC.noteForEdit=selectedNote
            }
        }else if segue.identifier == "addNote"{
            print("点击加号跳转")
            
            var selectedyear = calendars.component(.year , from: selectedDate)
            var selectedmonth = calendars.component(.month , from: selectedDate)
            var selectedday = calendars.component(.day , from: selectedDate)
            var selectedweekday = calendars.component(.weekday, from: selectedDate)
            
            print("selected day :year is \(selectedyear),month is \(selectedmonth),day is \(selectedday),weekday is \(selectedweekday)")
            
            var selectedWeekday : String = ""
            
            switch(selectedweekday){
            case 1:
                selectedWeekday="星期日"
            case 2:
                selectedWeekday="星期一"
            case 3:
                selectedWeekday="星期二"
            case 4:
                selectedWeekday="星期三"
            case 5:
                selectedWeekday="星期四"
            case 6:
                selectedWeekday="星期五"
            case 7:
                selectedWeekday="星期六"
            default:
                print("星期几选择出错")
            }
            
            destinationVC.noteForEdit = Note(year: selectedyear, month: selectedmonth, day: selectedday, weekday: selectedWeekday, noteContent: "", noteImages: nil, mood: nil, weather: nil)
        }
        else{
            print("跳转失败")
        }
        
     }
    
    
}
