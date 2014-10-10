//
//  ViewController.swift
//  Exam1_55011212028
//
//  Created by student on 10/10/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    @IBOutlet var name: UITextField!
    @IBOutlet var volume: UITextField!
    @IBOutlet var price: UITextField!
    @IBOutlet var showmoney: UILabel!
    @IBOutlet var tableview: UITableView!
    
    let cellIdentifier = "cellIdentifier"
    var money = 0.00
    var tabledata: String[] = []
    var numvolume = 0.00
    var numprice = 0.00
    //คำนวณราคา
    @IBAction func butprice(sender: AnyObject) {
        numvolume = Double((volume.text as NSString).doubleValue)
        numprice = Double((price.text as NSString).doubleValue)
        
        money = numprice * numvolume
        
        showmoney.text = "\(money) Bath"
    }
    //คำนวณกำไร
    @IBAction func butprofit(sender: AnyObject) {
        let three = numvolume * (numprice * (3/100))
        tabledata[0] += (three as NSString)
        
        let five = numvolume * (numprice * (5/100))
        let ten = numvolume * (numprice * (10/100))
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

}

