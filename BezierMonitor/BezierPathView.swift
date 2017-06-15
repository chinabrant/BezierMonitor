//
//  BezierPathView.swift
//  BezierMonitor
//
//  Created by brant on 2017/6/14.
//  Copyright © 2017年 brant. All rights reserved.
//

import UIKit

enum BezierOrder {
    case second // 二阶
    case third  // 三阶
}

class BezierPathView: UIView {
    
    var berzierPath = UIBezierPath()
    
    lazy var pathLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = self.bounds
//        layer.path = berzierPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.red.cgColor
        return layer
    }()
    
    
    
    lazy var startPointView: TouchableView = {
        let view = TouchableView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        view.backgroundColor = UIColor.orange
//        view.moved = self.mov
        view.moved = {()->Void in
            self.startMonitor()
        }
        return view
    }()
    
    lazy var endPointView: TouchableView = {
        let view = TouchableView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        view.backgroundColor = UIColor.orange
        view.moved = {()->Void in
            self.startMonitor()
        }
        return view
    }()
    
    lazy var controlPointView: TouchableView = {
        let view = TouchableView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        view.backgroundColor = UIColor.orange
        view.moved = {()->Void in
            self.startMonitor()
        }
        return view
    }()
    
    lazy var controlPointView2: TouchableView = {
        let view = TouchableView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        view.backgroundColor = UIColor.orange
        view.moved = {()->Void in
            self.startMonitor()
        }
        return view
    }()
    
    var order: BezierOrder = .second
    
    init(frame: CGRect, order: BezierOrder) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
        
        self.order = order
        
        self.startPointView.x = 0
        self.startPointView.y = self.height / 2.0
        self.endPointView.x = self.width - self.endPointView.width
        self.endPointView.y = self.height / 2.0
        self.controlPointView.x = self.width / 2.0
        self.controlPointView.y = 0
        
        self.addSubview(self.startPointView)
        self.addSubview(self.controlPointView)
        self.addSubview(self.endPointView)
        
        if order == .third {
            // 三阶
            self.controlPointView2.x = self.width / 4.0 * 3.0
            self.controlPointView2.y = self.height
            self.addSubview(self.controlPointView2)
        }
        
        self.pathLayer.frame = self.bounds
        self.layer.addSublayer(pathLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startMonitor() {
        
        berzierPath.removeAllPoints()
        berzierPath.move(to: self.startPointView.center)
        
        if self.order == .second {
            berzierPath.addQuadCurve(to: self.endPointView.center, controlPoint: self.controlPointView.center)
        }
        else {
            berzierPath.addCurve(to: self.endPointView.center, controlPoint1: self.controlPointView.center, controlPoint2: self.controlPointView2.center)
        }
        
        pathLayer.path = berzierPath.cgPath
        
    }
    
}
