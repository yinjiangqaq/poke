//
//  ViewController.swift
//  project1
//
//  Created by Apple on 2019/9/17.
//  Copyright © 2019 Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Account: UITextField!
    
    @IBOutlet weak var 登录成功: UILabel!
    
    @IBOutlet weak var 密码或用户名错误: UILabel!
    
    @IBAction func 登录(_ sender: Any) {
        if(( Account.text == "ZLD") && ( Password.text == "000")) {
            登录成功.isHidden = false
        }else{
            密码或用户名错误.isHidden=false
        }    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }}

