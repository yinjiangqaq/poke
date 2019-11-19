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
    
    
    @IBOutlet weak var AddFeeling: UIButton!
    @IBAction func AddFeelingButton(_ sender: Any) {
    }
    
    @IBOutlet weak var AddWeather: UIButton!
    @IBAction func AddWeatherButton(_ sender: Any) {
        let myAlert = weather(frame: CGRect(x: 0 , y: 0 , width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
        
        //各种callback
        myAlert.tapCallBack = {() -> () in
            myAlert.removeFromSuperview()
            print("click weather")
        }
        
        self.view.addSubview(myAlert)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        /////////////////////////
       
        /////////////////////////
        
        
//        let myAlert = weather(frame: CGRect(x: 0 , y: 0 , width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
//
//        myAlert.buttonCallBack = {() -> () in
//            myAlert.removeFromSuperview()
//            print("click it")
//        }
//        self.view.addSubview(myAlert)
        
       // AddFeeling.addTarget(self, action: #selector(AddFeelingFunction), for: .touchUpInside)
       // self.view.addSubview(AddFeeling)
        
       // AddWeather.addTarget(self, action: #selector(AddWeatherFunction), for: .touchUpInside)
       // self.view.addSubview(AddWeather)
        
        
        
        
    }
    
//    @objc func AddFeelingFunction(){
//
//    }
//
//    @objc func AddWeatherFunction(){
//
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func beginEdit(_ sender: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }

    @IBAction func endEdit(_ sender: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }

    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    

}
