//
//  FoodItemViewController.swift
//  SecondApp
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Nic. All rights reserved.
//

import UIKit

class FoodItemViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    var foodForEdit: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameText.text = foodForEdit?.name
        self.descriptionText.text = foodForEdit?.description
        self.navigationItem.title = foodForEdit?.name
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if((self.nameText.text != "") && (self.descriptionText.text != "")){
            self.foodForEdit?.name = self.nameText.text
            self.foodForEdit?.description = self.descriptionText.text
        }
    }
    

}
