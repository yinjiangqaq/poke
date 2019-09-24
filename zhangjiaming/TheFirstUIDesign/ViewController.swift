//
//  ViewController.swift
//  TheFirstUIDesign
//
//  Created by turtlejermine on 2019/9/17.
//  Copyright © 2019年 turtlejermine. All rights reserved.
//

import UIKit

class user{
    var name : String = ""
    var account :String = ""
    var password :String = ""
    
    init(Name:String,Account:String,Password:String) {
        self.name=Name
        self.account=Account
        self.password=Password
    }
    
}

class ViewController: UIViewController {
    
////    private var myAccount : String = "827706950"
////    private var myPassWord :String = "123"

    var userSet : Array<user> = []
    
    func checkUserAccount(accoutn : String) -> Bool {
        return false
    }
    
    func checkUserPassword(password : String) -> Bool {
        return false
    }

    @IBOutlet weak var Account: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBAction func SignIn(_ sender: Any) {
//        if Account.text == "827706950" && Password.text == "123"{
//            tip.text="Success"
//            tip.textColor=UIColor.green
//            tip.isHidden=false
//        }
        if Account.text == "827706950" && Password.text == "123"{
            tip.text="Success"
            tip.textColor=UIColor.green
            tip.isHidden=false
        }
        else{
            tip.text="Password or account is wrong"
            tip.textColor=UIColor.red
            tip.isHidden=false
        }
    }
    @IBAction func SignUp(_ sender: Any) {
        tip.text="Sorry! This function hasn't been done"
        tip.textColor=UIColor.blue
        tip.isHidden=false
    }
    @IBOutlet weak var tip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

