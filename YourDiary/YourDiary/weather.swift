//
//  weather.swift
//  YourDiary
//
//  Created by TurtleJermine on 2019/11/17.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class weather: UIView {

    @IBOutlet weak var TestDisplayBtn: UIButton!
    
    var ConnectView : UIView!
    
    var buttonCallBack:(() -> ())?
    
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
    
    
    func initialSetup(){
        self.backgroundColor = UIColor(red: 0/225.0, green: 0/225.0, blue: 0/225.0, alpha: 0.3)
        
    }
    
    
    @IBAction func AlertBtnAction(_ sender: Any) {
        if buttonCallBack != nil {
            buttonCallBack!()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
