//
//  DescriptionViewController.swift
//  TheFirstUIDesign
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 turtlejermine. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodName.text=self.foodForEdit?.name
        self.foodDescription.text=self.foodForEdit?.foodDescription
        self.navigationItem.title=self.foodForEdit?.name

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Save(_ sender: Any) {
    }
    @IBAction func Cancel(_ sender: Any) {
    }
    @IBOutlet weak var foodName: UITextField!
    
    @IBOutlet weak var foodDescription: UITextField!
    
    var foodForEdit: Food?
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "saveToList"){
            if ((self.foodName.text != "") && (self.foodDescription.text != "") ){
                self.foodForEdit?.name = self.foodName.text
                self.foodForEdit?.foodDescription = self.foodDescription.text
            }
        }else if (segue.identifier == "cancelToList") {
            
        }
    }
 

}
