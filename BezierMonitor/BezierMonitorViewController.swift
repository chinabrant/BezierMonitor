//
//  BezierMonitorViewController.swift
//  BezierMonitor
//
//  Created by brant on 2017/6/14.
//  Copyright © 2017年 brant. All rights reserved.
//

import UIKit

class BezierMonitorViewController: UIViewController {
    
    var bezierPathView: BezierPathView?
    
    var order: BezierOrder = .second

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "二阶"
        
        if self.order == .third {
            self.title = "三阶"
        }

        self.bezierPathView = BezierPathView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 300), order: self.order)
        self.bezierPathView!.frame = CGRect(x: 0, y: 64, width: self.view.width, height: self.view.height - 64)
        
        self.view.addSubview(self.bezierPathView!)
        self.bezierPathView!.startMonitor()
    }

    

}
