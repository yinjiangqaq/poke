//
//  diaryEditViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class diaryEditViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    

    @IBOutlet weak var Image1: UIImageView!
    
    @IBOutlet weak var DiaryTitle: UITextField!
    @IBOutlet weak var DiaryContent: UITextField!
    
    
    @IBAction func AddFeelingButton(_ sender: Any) {
    }
    
    @IBAction func AddWeatherButton(_ sender: Any) {
    }
    
    
    @IBAction func takePhoto(_ sender: Any ){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tapPhoto(_ sender: Any ){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.Image1.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
