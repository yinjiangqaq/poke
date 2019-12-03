//
//  extensionViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/26.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class extensionViewController: UIViewController {
    
    @IBOutlet weak var content: UITextField!
    @IBOutlet weak var Save: UIBarButtonItem!
    
    var userforedit:username?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        self.content.text=userforedit?.userName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Save"{
            print("save")
            userforedit = username(userName: self.content.text)

            }
        }
    
    }
    


