//
//  loginViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    var userForEdit: user?
    var userList: [user] = [user]()
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func userLogin(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }
    func showAlert(mes: String) {
        
        let alertController = UIAlertController(title: "提示！",message: mes, preferredStyle: .alert)
        
        //显示提示框
        
        self.present(alertController, animated: true, completion: nil)
        
        //两秒钟后自动消失
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
            self.presentedViewController?.dismiss(animated: false, completion: nil)
            
        }
        
        
    }


 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "loginToIndex"){
            
            if (email.text == "" || password.text == "")
            {
                print("未输入邮箱或密码")
                showAlert(mes: "未输入邮箱或密码")
            }
        }
    }
  

}
