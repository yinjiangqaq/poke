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
    @IBOutlet weak var content: UITextView!
    var images = [UIImage]()
    @IBOutlet weak var contentPic: UIScrollView!
    var noteForEdit:Note!
    @IBOutlet weak var textContent: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // if noteForEdit.year != nil && noteForEdit.month != nil{}
        let str:String = String(noteForEdit.year) + "年 " + String(noteForEdit.month) + "月"
        self.date.text = str
        self.day.text = String(noteForEdit.day)
        self.dayOfWeek.text = noteForEdit.weekday
        self.content.text = noteForEdit.noteContent
        images = noteForEdit.noteImages ?? [UIImage]()
        /*
        for item in images {
            let  myImageView = UIImageView(frame: CGRectMake())
            
            imageView.image = UIImage.init(named: "46_\(item).jpg")
            self.scrollView.addSubview(imageView)
            
        }
 */
    }
    
    
    
    // MARK: - Navigation	
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            noteForEdit.noteContent = self.content.text
            noteForEdit.noteImages = images
        }
        if segue.identifier == "cancelToList"{
            print("cancel")
        }
    }
    

}
