//
//  ViewController.swift
//  customSegmentDemo
//
//  Created by wuguanyu on 16/8/17.
//  Copyright © 2016年 wuguanyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segControl: SegmentSelectControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        segControl = SegmentSelectControl(frame: CGRect(x: 0, y: 54, width: screenWidth, height: 34))
        segControl?.backgroundColor = UIColor.yellowColor()
        segControl?.titles = ["全部", "热门", "卫视", "央视", "特色", "综合"]
        self.view.addSubview(segControl!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

