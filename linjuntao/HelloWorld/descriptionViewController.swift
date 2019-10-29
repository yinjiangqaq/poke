//
//  descriptionViewController.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class descriptionViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var foodName: UITextField!
    
    @IBAction func tapPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true,completion: nil)
    }
    @IBOutlet weak var foodContent: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true,completion: nil)
    }
    
    var foodForEdit: food?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodName.text = foodForEdit?.foodTitle
        self.foodContent.text = foodForEdit?.foodContent
        self.navigationItem.title = foodForEdit?.foodTitle
       self.image.image = foodForEdit?.foodAvatar
        foodForEdit?.foodTitle = self.foodName.text
            foodForEdit?.foodContent = self.foodContent.text
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.image.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "saveToList"){
        foodForEdit?.foodTitle = self.foodName.text
        foodForEdit?.foodContent = self.foodContent.text
            foodForEdit?.foodAvatar = self.image.image
            print("save")
        }
        if(segue.identifier == "cancelToList"){
            print("cancel")
        } //相当于详情页面的回调函数，也就是详情页面转移时一定会执行的函数,相当于把东西传出去

    }
 

}
