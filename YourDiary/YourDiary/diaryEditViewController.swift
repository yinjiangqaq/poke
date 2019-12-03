//
//  diaryEditViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/5.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class diaryEditViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    var centerY : CGFloat = 0.0
    //键盘高度
    var keyboardHeight : CGFloat = 0.0
    
    var judge : Bool = false
    
////////////////////图片
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var myFeeling: UIImageView!
    @IBOutlet weak var myWeather: UIImageView!
  //////////////////
    
    
////////////////////输入框
    @IBOutlet weak var DiaryContent: UITextField!
////////////////////
    
    
////////////////////按钮及事件
    @IBOutlet weak var AddFeeling: UIButton!
    @IBAction func AddFeelingButton(_ sender: Any) {
        let myAlert = feeling(frame: CGRect(x: 0 , y: 0 , width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
        
        //各种callback
        myAlert.tapCallBack = {() -> () in
            myAlert.removeFromSuperview()
            print("click feeling")
        }
        
        myAlert.testCallBack = {(testString) in
            print("get message "+testString)
            self.setFeelingImage(ima: testString)
            myAlert.removeFromSuperview()
        }
        
        
        self.view.addSubview(myAlert)
    }
    
    @IBOutlet weak var AddWeather: UIButton!
    @IBAction func AddWeatherButton(_ sender: Any) {
        let myAlert = weather(frame: CGRect(x: 0 , y: 0 , width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
        
        //各种callback
        myAlert.tapCallBack = {() -> () in
            myAlert.removeFromSuperview()
            print("click weather")
        }
        
        
        myAlert.testCallBack = {(testString) in
            print("get message "+testString)
            self.setWeatherImage(ima: testString)
            myAlert.removeFromSuperview()
        }
        
        self.view.addSubview(myAlert)
    }
///////////////////////////////////
    
    
//////////////////设置图片
    func setFeelingImage(ima : String){
        myFeeling.image = UIImage(named: ima)
    }
    
    func setWeatherImage(ima : String){
        myWeather.image = UIImage(named: ima)
    }
//////////////////////////
    
    
//////////////////////////上传图片
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
////////////////////////////////////
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DiaryContent.becomeFirstResponder()
        
//        centerY = DiaryContent.center.y
//
//
//
//        //追加键盘监听
//        // 监听键盘弹出通知
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name:UIResponder.keyboardWillShowNotification,object: nil)
//        // 监听键盘隐藏通知
//        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillHide(notification:)),name: UIResponder.keyboardWillHideNotification, object: nil)
//        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
/////////////////////键盘相关函数
    
    /// 监听键盘弹出
    @objc func keyboardWillShow(notification: NSNotification) {
        if judge {
            print("键盘即将2次弹出")
        }
        else {
            print("键盘即将弹出")
            
            
            guard let userInfo = notification.userInfo else {return}
            guard let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{return}
            //获取动画执行的时间
            var duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
            if duration == nil { duration = 0.25 }
            
            //获取键盘弹起的高度
            let keyboardTopYPosition = keyboardRect.height
            keyboardHeight = keyboardTopYPosition
            
            UIView.animate(withDuration: duration!, delay: 0, options: .allowAnimatedContent, animations: {
                self.DiaryContent.center.y = (self.centerY - keyboardTopYPosition)
                //这一步是至关重要的，设置当前textField的y值为原始y值减去键盘高度，由于始终是用原始y值去减，所以不管通知几次都不会错
            }, completion: nil)
            judge=true
        }
    }
    
    /// 监听键盘收回
    @objc func keyboardWillHide(notification: NSNotification) {
        print("键盘即将收回")
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowAnimatedContent, animations: {
            self.DiaryContent.center.y += self.keyboardHeight
            //用当前的y值加上键盘高度，最终使得textField回归原位
        }, completion: nil)
        
    }
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        animateViewMoving(up: true, moveValue: 100)
//    }
//    func textFieldDidEndEditing(textField: UITextField) {
//        animateViewMoving(up: false, moveValue: 100)
//    }
//
//    func animateViewMoving (up:Bool, moveValue :CGFloat){
//        var movementDuration:TimeInterval = 0.3
//        var movement:CGFloat = ( up ? -moveValue : moveValue)
//        UIView.beginAnimations( "animateView", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(movementDuration )
//        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
//        UIView.commitAnimations()
//    }
    
    
//
    deinit {
        // 删除键盘监听
        print("删除键盘监听")
        NotificationCenter.default.removeObserver(self)
    }

    
///////////////////////////////
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "saveTheNote"){
            
        }else if(segue.identifier == "cancelTheNote"){
            
        }
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
