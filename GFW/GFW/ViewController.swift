//
//  ViewController.swift
//  GFW
//
//  Created by 钱卫 on 2018/1/7.
//  Copyright © 2018年 钱卫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let lb = UILabel.init(frame: CGRect.init(x: 20, y: 20, width: 200, height: 100));
        lb.text = "ni you "
        lb.backgroundColor = UIColor.red
        self.view.addSubview(lb)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

