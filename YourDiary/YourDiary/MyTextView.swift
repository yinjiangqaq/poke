//
//  MyTextView.swift
//  YourDiary
//
//  Created by 赛炜城 on 2019/12/12.
//  Copyright © 2019 feng. All rights reserved.
//

import Foundation
class MyTextView: UITextView,UITextViewDelegate {

    override init(frame:CGRect, textContainer:NSTextContainer?) {

        super.init(frame: frame, textContainer: textContainer)

        //textview的一些设置

        self.delegate=self

        self.layer.borderColor = UIColor.lightGray.cgColor

        self.layer.borderWidth=0.5

        self.layer.cornerRadius=5

        self.layer.masksToBounds=true

    }

 

    required init?(coder aDecoder:NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }

    func textViewDidChange(_ textView:UITextView) {

        //获取frame值

        let frame = textView.frame

        //定义一个constrainSize值用于计算textview的高度

        let constrainSize=CGSize(width:frame.size.width,height:CGFloat(MAXFLOAT))

        //获取textview的真实高度

        var size = textView.sizeThatFits(constrainSize)

        //重新设置textview的高度

        textView.frame.size.height=size.height

    }

}

