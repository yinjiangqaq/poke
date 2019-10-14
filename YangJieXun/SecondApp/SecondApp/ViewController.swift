//
//  ViewController.swift
//  SecondApp
//
//  Created by Apple on 2019/9/17.
//  Copyright © 2019 Nic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var welcomeInfo: UILabel!
    @IBOutlet weak var loginSuccessfullyInfo: UILabel!
    @IBAction func enter(_ sender: Any) {
        if let id = UserID.text {
            welcomeInfo.text = "Welcome " + id
            welcomeInfo.isHidden = false;
        }
        if ((UserID.text == "Jackson Yang") &&
            (password.text == "0013454")){
            loginSuccessfullyInfo.isHidden = false
            loginSuccessfullyInfo.text = "login successfully"
        }
        else{
            loginSuccessfullyInfo.isHidden = false
            loginSuccessfullyInfo.text = "login failed, please check your name and password!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func exitToHere(segue: UIStoryboardSegue){
        
    }

}

