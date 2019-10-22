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
    
    private var userSet : Array<user> = []
    
    func clearText(){
        NameInput.text=""
        Account.text=""
        Password.text=""
    }
    
    func checkUserAccount(Account : String , Password : String) -> Bool{
        for i in stride(from: 0, to: userSet.count, by: 1){
            if userSet[i].account==Account{
                if userSet[i].password==Password{
                    Name.text=userSet[i].name
                    return true
                }
                else{
                    return false
                }
            }
        }
        return false
    }
    
    
    func addNewUser(name : String , account : String , password : String){
        userSet.append(user(Name: name, Account: account, Password: password))
    }

    @IBOutlet weak var HeadImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var NameFrame: UIStackView!
    @IBOutlet weak var NameInput: UITextField!
    
    
    @IBOutlet weak var AccountFrame: UIStackView!
    @IBOutlet weak var Account: UITextField!
    
    
    
    @IBOutlet weak var PasswordFrame: UIStackView!
    @IBOutlet weak var Password: UITextField!
    
    
    
    @IBOutlet weak var SignIn: UIButton!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var SignUp2: UIButton!
    @IBOutlet weak var Cancel: UIButton!
    @IBOutlet weak var Quit: UIButton!
    
    
    
    @IBAction func SignIn(_ sender: Any) {
        if checkUserAccount(Account: Account.text!, Password: Password.text!) {
            tip.text="Success"
            tip.textColor=UIColor.green
            
            HeadImage.isHidden=false
            Name.isHidden=false
            
            clearText()
            
            AccountFrame.isHidden=true
            PasswordFrame.isHidden=true
            SignIn.isHidden=true
            SignUp.isHidden=true
            Quit.isHidden=false
            
            tip.isHidden=false
        }
        else{
            clearText()
            tip.text="Password or account is wrong"
            tip.textColor=UIColor.red
            tip.isHidden=false
        }
    }
    
    @IBAction func SignUp(_ sender: Any) {
        clearText()
        HeadImage.isHidden=true
        Name.isHidden=true
        
        NameFrame.isHidden=false
        
        SignIn.isHidden=true
        SignUp.isHidden=true
        SignUp2.isHidden=false
        Cancel.isHidden=false
        tip.isHidden=true
    }
    
    @IBAction func SignUp2(_ sender: Any) {
        if (NameInput.text != "" && Account.text != "") && Password.text != ""{
            addNewUser(name: NameInput.text!, account: Account.text!, password: Password.text!)
            Name.text=NameInput.text
            clearText()
            
            
            HeadImage.isHidden=false
            Name.isHidden=false
            NameFrame.isHidden=true
            AccountFrame.isHidden=true
            PasswordFrame.isHidden=true
            SignUp2.isHidden=true
            Cancel.isHidden=true
            Quit.isHidden=false
            tip.text="Success"
            tip.textColor=UIColor.green
            tip.isHidden=false
        }
        else{
            clearText()
            tip.text="Please finish the message"
            tip.textColor=UIColor.red
            tip.isHidden=false
        }
    }
    
    @IBAction func Cancel(_ sender: Any) {
        clearText()
        NameFrame.isHidden=true
        SignIn.isHidden=false
        SignUp.isHidden=false
        SignUp2.isHidden=true
        Cancel.isHidden=true
        tip.isHidden=true
        
    }
    @IBAction func Quit(_ sender: Any) {
        clearText()
        HeadImage.isHidden=true
        Name.isHidden=true
        AccountFrame.isHidden=false
        PasswordFrame.isHidden=false
        Quit.isHidden=true
        SignIn.isHidden=false
        SignUp.isHidden=false
        tip.isHidden=true
    }
    
    @IBOutlet weak var tip: UILabel!
    
    @IBAction func exitToHere (segue:UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addNewUser(name: "TurtleJermine", account: "201730685011", password: "123456")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

