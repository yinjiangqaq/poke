//
//  forgetViewController.swift
//  YourDiary
//
//  Created by Apple on 2019/11/12.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class forgetViewController: UIViewController {
   override func viewDidLoad() {
        super.viewDidLoad()
    (UIImage *)clipImage2:(UIImage *)image do {
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 1.0);
        
        CGRect; rect = CGRectMake(0, 0, image.size.width, image.size.height);
        [[UIBezierPath, bezierPathWithRoundedRect:rect cornerRadius:image.size.width / 2] addClip];
        
        [image, drawInRect:rect];
        
        UIImage; *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }   // Do any additional setup after loading the view.
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
