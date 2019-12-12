//
//  NoteItemViewController.swift
//  YourDiary
//
//  Created by sunrise on 2019/11/21.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class NoteItemViewController: UIViewController {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var dateStack: UIStackView!
    var images = [UIImage]()
    @IBOutlet weak var allContent: UIScrollView!
    var noteForEdit:Note!
    let content = MyTextView(frame:CGRect(x:10,y:200,width:394,height:500))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // if noteForEdit.year != nil && noteForEdit.month != nil{}
        //allContent.addSubview(dateStack)
        allContent.addSubview(content)
        let str:String = String(noteForEdit.year) + "年 " + String(noteForEdit.month) + "月"
        self.date.text = str
        self.day.text = String(noteForEdit.day)
        self.dayOfWeek.text = noteForEdit.weekday
        content.text = noteForEdit.noteContent
        images = noteForEdit.noteImages ?? [UIImage]()
        content.isEditable = false
        
        for item in images {
            let img = UIImage(named: "\(item)")
            let imgView = UIImageView(image: img)
            allContent.addSubview(imgView)
        }
 
    }
    
    @IBAction func cancelToList (segue: UIStoryboardSegue){}

    @IBAction func saveToList(segue: UIStoryboardSegue){
        if let addNoteVC = segue.source as? diaryEditViewController{
            noteForEdit = addNoteVC.noteForEdit
            content.text=noteForEdit.noteContent
            /*if let addNote = addNoteVC.noteForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    foodList[(selectedIndexPath as NSIndexPath).row] = addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    foodList.append(addFood)
                    let newIndexPath = IndexPath(row: foodList.count-1, section:0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }*/
            
        }
        
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //页面跳转前的数据准备
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //如果跳转标识符是editDiary，则将当前cell的对应数据传给目标页面
        if segue.identifier == "editDiary"{
            print("edit diary")
            noteForEdit.noteContent = content.text
            noteForEdit.noteImages = images
            let editVC = segue.destination as! diaryEditViewController
            editVC.noteForEdit = noteForEdit
        }
    }
    

}
