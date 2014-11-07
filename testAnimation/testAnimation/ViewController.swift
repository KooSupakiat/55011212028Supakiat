//
//  ViewController.swift
//  testAnimation
//
//  Created by student on 11/7/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var square: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

