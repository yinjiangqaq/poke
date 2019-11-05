//
//  DescriptionViewController.swift
//  TheFirstUIDesign
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 turtlejermine. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodName.text=self.foodForEdit?.name
        self.foodDescription.text=self.foodForEdit?.foodDescription
        self.navigationItem.title=self.foodForEdit?.name
        self.foodImage.image=self.foodForEdit?.foodAvatar

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Save(_ sender: Any) {
    }
    @IBAction func Cancel(_ sender: Any) {
    }
    
    
    @IBOutlet weak var foodName: UITextField!
    
    @IBOutlet weak var foodDescription: UITextField!
    

    @IBOutlet weak var foodImage: UIImageView!
    
    var foodForEdit: Food?
    
    @IBAction func takePhoto(_ sender: Any){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }
    
    @IBAction func tapPhoto(_ sender: Any){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }
    

//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let selectedImage = info[UIImagePickerController.InfoKey.or] as! UIImage
//        self.foodImage.image = selectedImage
//        dismiss(animated: true, completion: nil)
//    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let seImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.foodImage.image = seImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "saveToList"){
            if ((self.foodName.text != "") && (self.foodDescription.text != "") ){
                self.foodForEdit?.name = self.foodName.text
                self.foodForEdit?.foodDescription = self.foodDescription.text
                self.foodForEdit?.foodAvatar = self.foodImage.image
            }
        }else if (segue.identifier == "cancelToList") {
            
        }
    }
 

}
