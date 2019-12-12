//
//  personEditViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class personEditViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    
    
    @IBAction func tap(_ sender: Any) {
        tapphoto(sender)
        
    }
    @IBOutlet weak var touxiang: UIImageView!
    @IBOutlet weak var NICKNAME: UILabel!
    @IBOutlet weak var SIGN: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touxiang.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func cancelToList (segue: UIStoryboardSegue){
        
    }
    @IBAction func saveToList1 (segue: UIStoryboardSegue){
        if let addUserVC = segue.source as? extensionViewController{
            if let addUser = addUserVC.userforedit{
                NICKNAME.text = addUser.userName
                
            }
        }
    }
    @IBAction func saveToList2 (segue: UIStoryboardSegue){
        if let addUserVC = segue.source as? extension2ViewController{
            if let addUser = addUserVC.userforedit2{
                SIGN.text = addUser.userSign
                
            }
        }
    }
    @IBAction func tapphoto(_ sender: Any) {
        print("success")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.touxiang.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    
    
    
}
