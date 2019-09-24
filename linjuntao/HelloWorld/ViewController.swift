//
//  ViewController.swift
//  HelloWorld
//
//  Created by Apple on 2019/9/10.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var res: UILabel!
    @IBOutlet weak var hello_label: UILabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var passText: UITextField!
    @IBAction func loginButtonClick(_ sender: Any) {
        if let userName = nameText.text{
            welcomeLabel.text = "welcome    " + userName
        }
        if ((nameText.text == "lin") && (passText.text == "123")) {
            res.isHidden = false
            res.text = "login successfully"
        }else{
             res.isHidden = false
             res.text = "login failed,check your username and password!"
            res.textColor = UIColor.red //修改字体的颜色
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

