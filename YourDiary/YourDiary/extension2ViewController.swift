//
//  extension2ViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/12/3.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class extension2ViewController: UIViewController {

    @IBOutlet weak var content2: UITextField!
    @IBOutlet weak var Save2: UIBarButtonItem!
    
      var userforedit2:usersign?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.content2.text=userforedit2?.userSign
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Save2"{
            print("save2")
            userforedit2 = usersign(userSign:  self.content2.text)
            
        }
    }
    
}


