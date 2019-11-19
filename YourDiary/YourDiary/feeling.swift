//
//  feeling.swift
//  YourDiary
//
//  Created by Apple on 2019/11/19.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class feeling: UIView {

    
    var ConnectView : UIView!
    
    @IBAction func Tap(_ sender: Any) {
        if tapCallBack != nil {
            tapCallBack!()
        }
    }
    
    @IBAction func happy(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    
    @IBAction func angry(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    
    @IBAction func unhappy(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    
    @IBAction func laugh(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    
    @IBAction func cry(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    
    
    @IBAction func feelTired(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    
    @IBAction func normal(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    
    @IBAction func money(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    
    @IBAction func shock(_ sender: Any) {
        if testCallBack != nil {
            testCallBack!("get an image")
        }
    }
    var testCallBack: ((String)->())?
    var tapCallBack:(() -> ())?
//    var happyCallBack:(() -> ())?
//    var angryCallBack:(() -> ())?
//    var unhappyCallBack:(() -> ())?
//    var laughCallBack:(() -> ())?
//    var cryCallBack:(() -> ())?
//    var feelTiredCallBack:(() -> ())?
//    var normalCallBack:(() -> ())?
//    var moneyCallBack:(() -> ())?
//    var shockCallBack:(() -> ())?
    
    
    
    
    
    
    
    func initialSetup(){
        self.backgroundColor = UIColor(red: 0/225.0, green: 0/225.0, blue: 0/225.0, alpha: 0.3)
    }
    
    //从这里开始初始化，不用改
    override init(frame: CGRect) {
        super.init(frame: frame)
        ConnectView = loadViewFromNib()
        addSubview(ConnectView)
        addConstraints()
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        ConnectView = loadViewFromNib()
        addSubview(ConnectView)
        addConstraints()
        initialSetup()
    }
    
    
    func loadViewFromNib() -> UIView{
        let className = type(of: self)
        let bundle = Bundle(for: className)
        let name = NSStringFromClass(className).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func addConstraints(){
        ConnectView.translatesAutoresizingMaskIntoConstraints = false
        var constraint = NSLayoutConstraint(item: ConnectView, attribute: .leading,
                                            relatedBy: .equal, toItem: self, attribute: .leading,
                                            multiplier: 1, constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: ConnectView, attribute: .trailing,
                                        relatedBy: .equal, toItem: self, attribute: .trailing,
                                        multiplier: 1, constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: ConnectView, attribute: .top, relatedBy: .equal,
                                        toItem: self, attribute: .top, multiplier: 1, constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: ConnectView, attribute: .bottom,
                                        relatedBy: .equal, toItem: self, attribute: .bottom,
                                        multiplier: 1, constant: 0)
        addConstraint(constraint)
    }
    //尾部
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
