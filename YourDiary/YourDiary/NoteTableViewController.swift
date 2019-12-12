//
//  NoteTableViewController.swift
//  YourDiary
//
//  Created by sunrise on 2019/11/21.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    var notes:[Note] = [Note]()
    
    //持久化保存notes文件
    func saveNoteFile(){
        let success = NSKeyedArchiver.archiveRootObject(notes, toFile: Note.ArchiveURL.path)
        if !success{
            print("Failed ...")
        }
    }
    
    //加载持久化保存的数据
    func loadNoteFile() -> [Note]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Note.ArchiveURL.path) as? [Note])
    }
    
    //初始化notes列表
    func initNoteList(){
        let temp = loadNoteFile()
        //??表示可选且若temp为空使用默认值[Note]()
        if(temp == nil){
            notes.append(Note(year:2017, month:3 , day:20, weekday:"星期一", noteContent:"春江潮水连海平，海上明月共潮生\n春江潮水连海平，海上明月共潮生\n春江潮水连海平，海上明月共潮生\n春江潮水连海平，海上明月共潮生", noteImages:nil, mood:nil, weather:nil))
            //mood:UIImage(named: "logo"), weather:UIImage(named: "liulan")
        }else{
            notes = temp ?? [Note]()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNoteList()
        self.tableView.rowHeight = 100
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item;
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    //设置table的格数
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //设置table的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    //将数组notes的内容设置到cell中去
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! NoteTableViewCell
    
        cell.day.text = String(notes[indexPath.row].day)
        cell.dayOfWeek.text = notes[indexPath.row].weekday
        cell.date.text = String(notes[indexPath.row].year)+"."+String(notes[indexPath.row].month)+"."+String(notes[indexPath.row].day)
        let str1 = notes[indexPath.row].noteContent
        if(str1!.count<=10){
            cell.content.text = str1
        }else{
            let chars = String(str1!.prefix(10))
            let subStr = chars + "..."
            cell.content.text = subStr
        }
        cell.moodImg?.image = notes[indexPath.row].mood
        cell.weatherImg?.image = notes[indexPath.row].weather
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    //重写以支持表视图的编辑
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            notes.remove(at: indexPath.row)
            saveNoteFile()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation/Users/sunrise/Desktop/poke/YangJieXun/SecondApp/SecondApp
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //跳转到item页面前传数据
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //如果跳转标识符是showDetail，则将当前cell的对应数据传给目标页面
        if(segue.identifier == "showItem"){
            //声明一个目标页面的代理
            let descriptionVC = segue.destination as! NoteItemViewController
            if let selectedCell = sender as? UITableViewCell{
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedNote = notes[(indexPath as NSIndexPath).row]
                descriptionVC.noteForEdit = selectedNote
            }
            print("show item")
        }
            //否则，创建一个新的空白对象传给目标页面
        else{
            //声明一个目标页面的代理
            let descriptionVC = segue.destination as! diaryEditViewController
            let calendar:Calendar = Calendar.current
            let now = Date()
            let yearValue = calendar.component(.year, from: now)
            let monthValue = calendar.component(.month, from: now)
            let dayValue = calendar.component(.day, from: now)
            let weekdayValue = calendar.component(.weekday, from: now)
            var weekdayStr:String
            switch(weekdayValue){
            case 1:
                weekdayStr = "星期日"
            case 2:
                weekdayStr = "星期一"
            case 3:
                weekdayStr = "星期二"
            case 4:
                weekdayStr = "星期三"
            case 5:
                weekdayStr = "星期四"
            case 6:
                weekdayStr = "星期五"
            case 7:
                weekdayStr = "星期六"
            default:
                return
            }
            descriptionVC.noteForEdit = Note(year: yearValue, month: monthValue, day: dayValue, weekday: weekdayStr,  noteContent: "", noteImages: [UIImage](), mood: nil, weather: nil)
            print("add item")
        }
        
    }
    
    //item页面中取消按钮调用的方法
    @IBAction func cancelToList (segue: UIStoryboardSegue){}
    
    //item页面中保存按钮调用的方法
    @IBAction func saveToList(segue: UIStoryboardSegue){
//        if let addNoteVC = segue.source as? diaryEditViewController{
        if let addNoteVC = segue.source as? NoteItemViewController{
            if let addNote = addNoteVC.noteForEdit{
                //如果是修改已有的日记项，则保存新的值
                //先在数组中修改数据，再传到表格中
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    notes[(selectedIndexPath as NSIndexPath).row] = addNote
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
                    //否则（新的日记），
                    //如果新日记文本部分不为空，则增加一条值
                    //如果为空，就无任何动作
                    //先在数组中增加数据，再在表格中增加
                else{
                    if addNote.noteContent != "" && addNote.noteContent != nil{
                        notes.append(addNote)
                        let newIndexPath = IndexPath(row: notes.count-1, section:0)
                        tableView.insertRows(at: [newIndexPath], with: .automatic)
                    }
                }
                print("NoteTableViewController saveToList note.content is \(addNote.noteContent)")
                
            }
            
        }
        
        //持久化保存数据
        saveNoteFile()
    }
}
