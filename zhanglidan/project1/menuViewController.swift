//
//  menuViewController.swift
//  project1
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Younger. All rights reserved.
//

import UIKit

class menuViewController: UIViewController {
   
    @IBOutlet weak var foodname: UITextField!
   
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var saveToList: UIBarButtonItem!

    
    var foodForEdit: food?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.foodname.text = foodForEdit?.name
        self.Description.text = foodForEdit?.fooddescription
        self.navigationItem.title = foodForEdit?.name
    }
    

    /*
    // MARK: - Navigation
*/
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            foodForEdit = food(name: self.foodname.text!,description: self.Description.text!)
        }
        if segue.identifier == "cancelToList"{
            print("cancel")
        }
    }

}
