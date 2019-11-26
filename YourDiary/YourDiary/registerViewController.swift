//
//  registerViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {
  var userForEdit: user?
    var userList: [user] = [user]()
   
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var identifyingCode: UITextField!

    @IBOutlet weak var email: UITextField!
    
    
//    用户返回
    @IBAction func cancelRegister(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    //用户点击注册按钮
    @IBAction func userRegister(_ sender: Any) {
      
        userForEdit?.userEmail = self.email.text
        userForEdit?.userPassword = self.password.text
//        userForEdit?.portrait = nil
//        userForEdit?.userAge = nil
//        userForEdit?.userInfo = nil
//        userForEdit?.userName = nil
//        userForEdit?.userSex = nil
      
        userList.append(user(userName: nil, userSex: nil, userEmail:  userForEdit?.userEmail, userPassword: userForEdit?.userPassword, portrait: nil, userInfo: nil, userAge: nil))
        saveUserFile()
        print(userList.count)
    }
    
    
    
    func initUserList()
        {
    var userList: [user]? = loadUserFile()
    }
    
    func saveUserFile(){
        let success = NSKeyedArchiver.archiveRootObject(userList, toFile: user.ArchiveURL.path)
        if !success{
            print("Failed ...")
        }
    }
    
    
    func loadUserFile() -> [user]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: user.ArchiveURL.path) as? [user])
    }
      override func viewDidLoad() {
        super.viewDidLoad()
        initUserList()
        // Do any additional setup after loading the view.
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
