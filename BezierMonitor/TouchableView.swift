//
//  TouchableView.swift
//  BezierMonitor
//
//  Created by brant on 2017/6/14.
//  Copyright © 2017年 brant. All rights reserved.
//

import UIKit

class TouchableView: UIView {
    
    var moved: (()->Void)?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = (touches as! NSSet).anyObject() as! UITouch
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = (touches as NSSet).anyObject() as! UITouch
        
        var center = touch.location(in: self.superview)
        if center.x < self.width / 2.0 {
            center.x = self.width / 2.0
        }
        
        if center.y < self.height / 2.0 {
            center.y = self.height / 2.0
        }
        
        if center.x > self.superview!.width - self.width / 2.0 {
            center.x = self.superview!.width - self.width / 2.0
        }
        
        if center.y > self.superview!.height - self.height / 2.0 {
            center.y = self.superview!.height - self.height / 2.0
        }
        
        self.center = center
        self.moved?()
    }

}
