//
//  SegmentSelectControl.swift
//  customSegmentDemo
//
//  Created by wuguanyu on 16/8/17.
//  Copyright © 2016年 wuguanyu. All rights reserved.
//

import UIKit
import SwiftHEXColors

class SegmentSelectButton : UIButton {
    override var highlighted: Bool {
        didSet {
            if highlighted {
                backgroundColor = UIColor(hex: 0xF55F5F)
                layer.borderColor = UIColor(hex: 0xF55F5F)?.CGColor
            }
        }
    }
    
    override var selected: Bool {
        didSet {
            backgroundColor = selected ? UIColor(hex: 0xF55F5F) : UIColor.whiteColor()
            layer.borderColor = selected ? UIColor(hex: 0xF55F5F)?.CGColor : UIColor(hex: 0xD9D9D9)?.CGColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor(hex: 0xD9D9D9)?.CGColor
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.setTitleColor(UIColor(hex: 0x666666), forState: .Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        self.setTitleColor(UIColor.whiteColor(), forState: .Selected)
        self.titleLabel?.font = UIFont.systemFontOfSize(12)
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class SegmentSelectControl: UIControl {

    var titles = [String]() {
        didSet {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let screenWidth = screenSize.width
            let btnWidth = (screenWidth - 10) / 6.0 - 10
            for (idx, aTitle) in titles.enumerate() {
                let posX = CGFloat(idx) * (btnWidth + 10)
                let aBtn = SegmentSelectButton(frame: CGRect(x: 10 + posX, y: 10, width: btnWidth, height: 24))
                aBtn.setTitle(aTitle, forState: .Normal)
                self.addSubview(aBtn)
                
                buttons.append(aBtn)
                aBtn.addTarget(self, action: #selector(touchBtn(_:)), forControlEvents: .TouchUpInside)
            }
        }
    }
    
    var buttons = [UIButton]()
    
    var selectIndex = 0
    
    func touchBtn(sender: UIButton) {
        for aBtn in buttons {
            aBtn.selected = false
        }
        
        sender.selected = true
        
        selectIndex = buttons.indexOf(sender) ?? 0
        
        self.sendActionsForControlEvents(.ValueChanged)
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func setupFirstBtn() {
        buttons.first?.selected = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
