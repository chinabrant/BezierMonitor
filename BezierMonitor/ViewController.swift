//
//  ViewController.swift
//  BezierMonitor
//
//  Created by brant on 2017/6/14.
//  Copyright © 2017年 brant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var secondMonitor: UIButton!

    @IBAction func secondMonitorClicked(_ sender: Any) {
        let vc = BezierMonitorViewController()
        vc.order = .second
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func thirdMonitorClicked(_ sender: Any) {
        let vc = BezierMonitorViewController()
        vc.order = .third
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

