//
//  FoodItemViewController.swift
//  SecondApp
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Nic. All rights reserved.
//

import UIKit

class FoodItemViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    
    @IBOutlet weak var foodImage: UIImageView!
    
    var foodForEdit: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        self.nameText.text = foodForEdit?.foodName
        self.descriptionText.text = foodForEdit?.foodDescription
        self.navigationItem.title = foodForEdit?.foodName
        self.foodImage.image = foodForEdit?.foodAvatar
    }

    @IBAction func takePhoto(_ sender: Any) {
        let imagepicker = UIImagePickerController()
        imagepicker.sourceType = .photoLibrary
        imagepicker.delegate = self
        present(imagepicker, animated: true, completion: nil)
    }
    
    @IBAction func tapPhoto(_ sender: Any) {
        let imagepicker = UIImagePickerController()
        imagepicker.sourceType = .photoLibrary
        imagepicker.delegate = self
        present(imagepicker, animated: true, completion: nil)
    }
    
    
    
    
    func imagePickerController(_picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.foodImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            foodForEdit = Food(name: self.nameText.text!,description: self.descriptionText.text!, foodAvatar: self.foodImage.image)
        }
        if segue.identifier == "cancelToList"{
            print("cancel")
        }
        /*if((self.nameText.text != "") && (self.descriptionText.text != "")){
            self.foodForEdit?.name = self.nameText.text
            self.foodForEdit?.description = self.descriptionText.text
        }*/
    }
    

}
